import 'dart:math' as math;

import 'package:dart_tabulate/dart_tabulate.dart';

import 'table_internal.dart';
import 'utils.dart';

class Row extends Iterable<Cell> {
  Row({required TableInternal parent}) : _parent = parent;

  final TableInternal _parent;
  final List<Cell> _cells = [];
  TableTheme? _theme;

  void addCell(Cell cell) => _cells.add(cell);

  Cell cellAt(int index) => _cells[index];

  TableTheme get theme {
    if (_theme == null) {
      _theme = TableTheme.from(_parent.theme);
    } else {
      _theme = TableTheme.merge(_theme!, _parent.theme);
    }
    return _theme!;
  }

  List<Cell> get cells => _cells;

  Cell operator [](int index) => cellAt(index);

  @override
  Iterator<Cell> get iterator => _cells.iterator;

  // Returns the row height as configured
  // For each cell in the row, check the cell.theme.height
  // property and return the largest configured row height
  // This is used to ensure that all cells in a row are
  // aligned when printing the column
  int getConfiguredHeight() {
    int result = 0;
    for (int i = 0; i < length; ++i) {
      var cell = _cells[i];
      var theme = cell.theme;
      if (theme.height != null) {
        result = math.max(result, theme.height!);
      }
    }
    return result;
  }

  // Computes the height of the row based on cell contents
  // and configured cell padding
  // For each cell, compute:
  //   padding_top + (cell_contents / column height) + padding_bottom
  // and return the largest value
  //
  // This is useful when no cell.theme.height is configured
  // Call get_configured_height()
  // - If this returns 0, then use get_computed_height()
  int getComputedHeight(List<int> columnWidths) {
    int result = 0;
    for (int i = 0; i < length; ++i) {
      result = math.max(result, getCellHeight(i, columnWidths[i]));
    }
    return result;
  }

  // Returns padding_top + cell_contents / column_height + padding_bottom
  // for a given cell in the column
  // e.g.,
  // column width = 5
  // cell_contents = "I love tabulate" (size/length = 15)
  // padding top and padding bottom are 1
  // then, cell height = 1 + (15 / 5) + 1 = 1 + 3 + 1 = 5
  // The cell will look like this:
  //
  // .....
  // I lov
  // e tab
  // ulate
  // .....
  int getCellHeight(int cellIndex, int columnWidth) {
    int result = 0;
    Cell cell = _cells[cellIndex];
    var theme = cell.theme;
    var text = cell.getText();
    int paddingLeft = theme.paddingLeft!;
    int paddingRight = theme.paddingRight!;
    result += theme.paddingTop!;

    if (columnWidth > (paddingLeft + paddingRight)) {
      columnWidth -= (paddingLeft + paddingRight);
    }

    // Check if input text has embedded newline characters
    int newlinesInText = '\n'.allMatches(text).length;
    String wordWrappedText;
    if (newlinesInText == 0) {
      // No new lines in input
      // Apply automatic word wrapping and compute row height
      wordWrappedText = wordWrap(text, columnWidth);
    } else {
      // There are embedded '\n' characters
      // Respect these characters
      wordWrappedText = text;
    }

    int newlinesInWrappedText = '\n'.allMatches(wordWrappedText).length;
    int estimatedRowHeight = newlinesInWrappedText;

    if (wordWrappedText.isNotEmpty && wordWrappedText[wordWrappedText.length - 1] != '\n') {
      estimatedRowHeight += 1;
    }

    result += estimatedRowHeight;

    result += theme.paddingBottom!;

    return result;
  }
}
