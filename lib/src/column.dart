import 'dart:math' as math;

import 'package:characters/characters.dart';
import 'package:dart_tabulate/dart_tabulate.dart';

import 'utils.dart';

class Column extends Iterable<Cell> {
  Column();

  final List<Cell> _cells = [];

  void addCell(Cell cell) => _cells.add(cell);

  Cell cellAt(int index) => _cells[index];

  List<Cell> get cells => _cells;

  Cell operator [](int index) => cellAt(index);

  ColumnFormat get theme => ColumnFormat(this);

  @override
  Iterator<Cell> get iterator => _cells.iterator;

  // Returns the column width as configured
  // For each cell in the column, check the cell.theme.width
  // property and return the largest configured column width
  // This is used to ensure that all cells in a column are
  // aligned when printing the column
  int getConfiguredWidth() {
    int result = 0;
    for (int i = 0; i < length; ++i) {
      var cell = _cells[i];
      var theme = cell.theme;
      if (theme.width != null) result = math.max(result, theme.width!);
    }
    return result;
  }

  // Computes the width of the column based on cell contents
  // and configured cell padding
  // For each cell, compute padding_left + cell_contents + padding_right
  // and return the largest value
  //
  // This is useful when no cell.theme.width is configured
  // Call get_configured_width()
  // - If this returns 0, then use get_computed_width()
  int getComputedWidth() {
    int result = 0;
    for (int i = 0; i < length; ++i) {
      result = math.max(result, getCellWidth(i));
    }
    return result;
  }

  // Returns padding_left + cell_contents.size() + padding_right
  // for a given cell in the column
  int getCellWidth(int cellIndex) {
    int result = 0;
    Cell cell = _cells[cellIndex];
    var theme = cell.theme;
    if (theme.paddingLeft != null) {
      result += theme.paddingLeft!;
    }

    // Check if input text has newlines
    String text = cell.getText().stripAnsi;
    var splittedLines = splitLines(text, "\n");

    // If there are no newlines in input, set column_width = text.size()
    if (splittedLines.length == 1) {
      result += cell.length;
    } else {
      // There are newlines in input
      // Find widest substring in input and use this as column_width
      int widestSubstringSize = 0;
      for (var line in splittedLines) {
        if (line.characters.length > widestSubstringSize) widestSubstringSize = line.characters.length;
      }
      result += widestSubstringSize;
    }

    if (theme.paddingRight != null) result += theme.paddingRight!;

    return result;
  }
}
