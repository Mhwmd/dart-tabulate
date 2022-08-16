import 'dart:math' as math;

import 'package:characters/characters.dart';
import 'package:dart_tabulate/dart_tabulate.dart';

import 'table_internal.dart';
import 'utils.dart';

class Printer {
  static Pair<List<int>, List<int>> computeCellDimensions(TableInternal table) {
    int numRows = table.length;
    int numColumns = table.estimateNumColumns();

    List<int> rowHeights = [], columnWidths = [];

    for (int i = 0; i < numColumns; ++i) {
      Column column = table.columnAt(i);
      int configuredWidth = column.getConfiguredWidth();
      int computedWidth = column.getComputedWidth();
      columnWidths.add(configuredWidth != 0 ? configuredWidth : computedWidth);
    }

    for (int i = 0; i < numRows; ++i) {
      Row row = table.rowAt(i);
      int configuredHeight = row.getConfiguredHeight();
      int computedHeight = row.getComputedHeight(columnWidths);

      // NOTE: Unlike column width, row height is calculated as the max
      // b/w configured height and computed height
      // which means that .width() has higher precedence than .height()
      // when both are configured by the user
      //
      // TODO: Maybe this can be configured?
      // If such a configuration is exposed, i.e., prefer height over width
      // then the logic will be reversed, i.e.,
      // columnWidths.push_back(std::max(configuredWidth, computedWidth))
      // and
      // row_height = configuredHeight if != 0 else computedHeight

      rowHeights.add(math.max(configuredHeight, computedHeight));
    }

    return Pair(rowHeights, columnWidths);
  }

  static void renderTable(StringBuffer stringBuffer, TableInternal table) {
    int numRows = table.length;
    int numColumns = table.estimateNumColumns();
    var dimensions = computeCellDimensions(table);
    var rowHeights = dimensions.first;
    var columnWidths = dimensions.second;

    // For each row,
    for (int i = 0; i < numRows; ++i) {
      // Print top border
      bool borderTopPrinted = true;
      for (int j = 0; j < numColumns; ++j) {
        borderTopPrinted = renderCellBorderTop(
          stringBuffer,
          table,
          Pair(i, j),
          Pair(rowHeights[i], columnWidths[j]),
          numColumns,
        );
      }
      if (borderTopPrinted) stringBuffer.writeln(TermColor.reset);

      // Print row contents with word wrapping
      for (int k = 0; k < rowHeights[i]; ++k) {
        for (int j = 0; j < numColumns; ++j) {
          renderRowInCell(stringBuffer, table, Pair(i, j),
              Pair(rowHeights[i], columnWidths[j]), numColumns, k);
        }
        if (k + 1 < rowHeights[i]) stringBuffer.writeln(TermColor.reset);
      }

      if (i + 1 == numRows) {
        // Check if there is bottom border to print:
        var bottomBorderNeeded = true;
        for (int j = 0; j < numColumns; ++j) {
          var cell = table.rowAt(i).cellAt(j);
          var theme = cell.theme;
          var corner = theme.cornerBottomLeft!;
          var borderBottom = theme.borderBottom!;
          if (corner == "" && borderBottom == "") {
            bottomBorderNeeded = false;
            break;
          }
        }

        if (bottomBorderNeeded) stringBuffer.writeln(TermColor.reset);
        // Print bottom border for table
        for (int j = 0; j < numColumns; ++j) {
          renderCellBorderBottom(
            stringBuffer,
            table,
            Pair(i, j),
            Pair(rowHeights[i], columnWidths[j]),
            numColumns,
          );
        }
      }

      if (i + 1 < numRows)
        stringBuffer
            .writeln(TermColor.reset); // Don't add newline after last row
    }
  }

  static void renderRowInCell(
    StringBuffer stringBuffer,
    TableInternal table,
    Pair<int, int> index,
    Pair<int, int> dimension,
    int numColumns,
    int rowIndex,
  ) {
    var columnWidth = dimension.second;
    var cell = table.rowAt(index.first).cellAt(index.second);
    var theme = cell.theme;
    var text = cell.getText();
    var wordWrappedText = wordWrap(text, columnWidth);
    var textHeight = '\n'.allMatches(wordWrappedText).length + 1;
    var paddingTop = theme.paddingTop!;
    if (theme.isShowBorderLeft!) {
      applyElementStyle(stringBuffer, theme.borderLeftColor!,
          theme.borderLeftBackground!, {});
      stringBuffer.write(theme.borderLeft!);
      resetElementStyle(stringBuffer);
    }

    applyElementStyle(
        stringBuffer, theme.fontColor!, theme.fontBackground!, {});

    if (rowIndex < paddingTop) {
      // Padding top
      stringBuffer.write(" " * columnWidth);
    } else if (rowIndex >= paddingTop &&
        (rowIndex <= (paddingTop + textHeight))) {
      // // Row contents

      // Retrieve padding left and right
      // (columnWidth - padding_left - padding_right) is the amount of space
      // available for cell text - Use this to word wrap cell contents
      var paddingLeft = theme.paddingLeft!;
      var paddingRight = theme.paddingRight!;

      // Check if input text has embedded \n that are to be respected
      var newlinesInInput = splitLines(text, "\n").length - 1;
      String wordWrappedText = "";

      // If there are no embedded \n characters, then apply word wrap
      if (newlinesInInput == 0) {
        // Apply word wrapping to input text
        // Then display one word-wrapped line at a time within cell
        if (columnWidth > (paddingLeft + paddingRight)) {
          wordWrappedText =
              wordWrap(text, columnWidth - paddingLeft - paddingRight);
        } else {
          // Configured column width cannot be lower than (padding_left + padding_right)
          // This is a bad configuration
          // E.g., the user is trying to force the column width to be 5
          // when padding_left and padding_right are each configured to 3
          // (padding_left + padding_right) = 6 > columnWidth
        }
      } else {
        wordWrappedText = text; // repect the embedded '\n' characters
      }

      var lines = splitLines(wordWrappedText, "\n");

      if (rowIndex - paddingTop < lines.length) {
        var line = lines[rowIndex - paddingTop];

        // Print left padding characters
        stringBuffer.write(" " * paddingLeft);

        // Print word-wrapped line
        line = line.trim();
        var lineWithPaddingSize =
            line.stripAnsi.characters.length + paddingLeft + paddingRight;

        switch (theme.textAlign!) {
          case TextAlign.left:
            renderContentLeftAligned(
                stringBuffer, line, theme, lineWithPaddingSize, columnWidth);
            break;
          case TextAlign.center:
            renderContentCenterAligned(
                stringBuffer, line, theme, lineWithPaddingSize, columnWidth);
            break;
          case TextAlign.right:
            renderContentRightAligned(
                stringBuffer, line, theme, lineWithPaddingSize, columnWidth);
            break;
        }

        // Print right padding characters
        stringBuffer.write(" " * paddingRight);
      } else {
        stringBuffer.write(" " * columnWidth);
      }
    } else {
      // Padding bottom
      stringBuffer.write(" " * columnWidth);
    }

    resetElementStyle(stringBuffer);

    if (index.second + 1 == numColumns) {
      // Print right border after last column
      if (theme.isShowBorderRight!) {
        applyElementStyle(stringBuffer, theme.borderRightColor!,
            theme.borderRightBackground!, {});
        stringBuffer.write(theme.borderRight!);
        resetElementStyle(stringBuffer);
      }
    }
  }

  static bool renderCellBorderTop(
      StringBuffer stringBuffer,
      TableInternal table,
      Pair<int, int> index,
      Pair<int, int> dimension,
      int numColumns) {
    var cell = table.rowAt(index.first).cellAt(index.second);
    var theme = cell.theme;
    var columnWidth = dimension.second;

    var corner = theme.cornerTopLeft!;
    var cornerColor = theme.cornerTopLeftColor!;
    var cornerBackgroundColor = theme.cornerTopLeftBackground!;
    var borderTop = theme.borderTop!;

    if ((corner == "" && borderTop == "") || !theme.isShowBorderTop!)
      return false;

    applyElementStyle(stringBuffer, cornerColor, cornerBackgroundColor, {});
    stringBuffer.write(corner);
    resetElementStyle(stringBuffer);

    for (int i = 0; i < columnWidth; ++i) {
      applyElementStyle(
          stringBuffer, theme.borderTopColor!, theme.borderTopBackground!, {});
      stringBuffer.write(borderTop);
      resetElementStyle(stringBuffer);
    }

    if (index.second + 1 == numColumns) {
      // Print corner after last column
      corner = theme.cornerTopRight!;
      cornerColor = theme.cornerTopRightColor!;
      cornerBackgroundColor = theme.cornerTopRightBackground!;

      applyElementStyle(stringBuffer, cornerColor, cornerBackgroundColor, {});
      stringBuffer.write(corner);
      resetElementStyle(stringBuffer);
    }
    return true;
  }

  static bool renderCellBorderBottom(
      StringBuffer stringBuffer,
      TableInternal table,
      Pair<int, int> index,
      Pair<int, int> dimension,
      int numColumns) {
    var cell = table.rowAt(index.first).cellAt(index.second);
    var theme = cell.theme;
    var columnWidth = dimension.second;

    var corner = theme.cornerBottomLeft!;
    var cornerColor = theme.cornerBottomLeftColor!;
    var cornerBackground = theme.cornerBottomLeftBackground!;
    var borderBottom = theme.borderBottom!;

    if ((corner == "" && borderBottom == "") || !theme.isShowBorderBottom!) {
      return false;
    }

    applyElementStyle(stringBuffer, cornerColor, cornerBackground, {});
    stringBuffer.write(corner);
    resetElementStyle(stringBuffer);

    for (int i = 0; i < columnWidth; ++i) {
      applyElementStyle(stringBuffer, theme.borderBottomColor!,
          theme.borderBottomBackground!, {});
      stringBuffer.write(borderBottom);
      resetElementStyle(stringBuffer);
    }

    if (index.second + 1 == numColumns) {
      // Print corner after last column
      corner = theme.cornerBottomRight!;
      cornerColor = theme.cornerBottomRightColor!;
      cornerBackground = theme.cornerBottomRightBackground!;

      applyElementStyle(stringBuffer, cornerColor, cornerBackground, {});
      stringBuffer.write(corner);
      resetElementStyle(stringBuffer);
    }
    return true;
  }

  static void applyElementStyle(StringBuffer stringBuffer,
      Color foregroundColor, Color backgroundColor, Set<FontStyle> fontStyle) {
    applyForegroundColor(stringBuffer, foregroundColor);
    applyBackground(stringBuffer, backgroundColor);
    for (var style in fontStyle) {
      applyFontStyle(stringBuffer, style);
    }
  }

  static void resetElementStyle(StringBuffer stringBuffer) {
    stringBuffer.write(TermColor.reset);
  }

  static void renderContentLeftAligned(
      StringBuffer stringBuffer,
      String cellContent,
      TableTheme theme,
      int textWithPaddingSize,
      int columnWidth) {
    // Apply font style
    applyElementStyle(stringBuffer, theme.fontColor!, theme.fontBackground!,
        theme.fontStyle!);
    stringBuffer.write(cellContent);
    // Only apply font_style to the font
    // Not the padding. So calling apply_element_style with font_style = {}
    resetElementStyle(stringBuffer);
    applyElementStyle(
        stringBuffer, theme.fontColor!, theme.fontBackground!, {});

    if (textWithPaddingSize < columnWidth) {
      for (int j = 0; j < (columnWidth - textWithPaddingSize); ++j) {
        stringBuffer.write(" ");
      }
    }
  }

  static void renderContentCenterAligned(
    StringBuffer stringBuffer,
    String cellContent,
    TableTheme theme,
    int textWithPaddingSize,
    int columnWidth,
  ) {
    int numSpaces = columnWidth - textWithPaddingSize;
    if (numSpaces % 2 == 0) {
      // Even spacing on either side
      for (int j = 0; j < numSpaces / 2; ++j) {
        stringBuffer.write(" ");
      }

      // Apply font style
      applyElementStyle(stringBuffer, theme.fontColor!, theme.fontBackground!,
          theme.fontStyle!);
      stringBuffer.write(cellContent);
      // Only apply font_style to the font
      // Not the padding. So calling apply_element_style with font_style = {}
      resetElementStyle(stringBuffer);
      applyElementStyle(
          stringBuffer, theme.fontColor!, theme.fontBackground!, {});

      for (int j = 0; j < numSpaces / 2; ++j) {
        stringBuffer.write(" ");
      }
    } else {
      int numSpacesBefore = numSpaces ~/ 2 + 1;
      for (int j = 0; j < numSpacesBefore; ++j) {
        stringBuffer.write(" ");
      }

      // Apply font style
      applyElementStyle(stringBuffer, theme.fontColor!, theme.fontBackground!,
          theme.fontStyle!);
      stringBuffer.write(cellContent);

      // Only apply font_style to the font
      // Not the padding. So calling apply_element_style with font_style = {}
      resetElementStyle(stringBuffer);
      applyElementStyle(
          stringBuffer, theme.fontColor!, theme.fontBackground!, {});

      for (int j = 0; j < numSpaces - numSpacesBefore; ++j) {
        stringBuffer.write(" ");
      }
    }
  }

  static void renderContentRightAligned(
    StringBuffer stringBuffer,
    String cellContent,
    TableTheme theme,
    int textWithPaddingSize,
    int columnWidth,
  ) {
    if (textWithPaddingSize < columnWidth) {
      for (int j = 0; j < (columnWidth - textWithPaddingSize); ++j) {
        stringBuffer.write(" ");
      }
    }

    // Apply font style
    applyElementStyle(stringBuffer, theme.fontColor!, theme.fontBackground!,
        theme.fontStyle!);
    stringBuffer.write(cellContent);
    // Only apply font_style to the font
    // Not the padding. So calling apply_element_style with font_style = {}
    resetElementStyle(stringBuffer);
    applyElementStyle(
        stringBuffer, theme.fontColor!, theme.fontBackground!, {});
  }

  static void applyFontStyle(StringBuffer stringBuffer, FontStyle style) {
    stringBuffer.write(style.apply());
  }

  static void applyForegroundColor(
      StringBuffer stringBuffer, Color foregroundColor) {
    stringBuffer.write(foregroundColor.apply());
  }

  static void applyBackground(StringBuffer stringBuffer, Color background) {
    stringBuffer.write(background.apply(isBackground: true));
  }
}
