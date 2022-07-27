import 'package:tabulate/tabulate.dart';

import 'theme.dart';

class ColumnFormat extends TableTheme {
  ColumnFormat(Column column) : _column = column;

  @override
  ColumnFormat setWidth(int value) {
    for (var cell in _column.cells) {
      cell.theme.setWidth(value);
    }
    return this;
  }

  @override
  ColumnFormat setHeight(int value) {
    for (var cell in _column.cells) {
      cell.theme.setHeight(value);
    }
    return this;
  }

// Padding
  @override
  ColumnFormat setPadding(int value) {
    for (var cell in _column.cells) {
      cell.theme.setPadding(value);
    }
    return this;
  }

  @override
  ColumnFormat setPaddingLeft(int value) {
    for (var cell in _column.cells) {
      cell.theme.setPaddingLeft(value);
    }
    return this;
  }

  @override
  ColumnFormat setPaddingRight(int value) {
    for (var cell in _column.cells) {
      cell.theme.setPaddingRight(value);
    }
    return this;
  }

  @override
  ColumnFormat setPaddingTop(int value) {
    for (var cell in _column.cells) {
      cell.theme.setPaddingTop(value);
    }
    return this;
  }

  @override
  ColumnFormat setPaddingBottom(int value) {
    for (var cell in _column.cells) {
      cell.theme.setPaddingBottom(value);
    }
    return this;
  }

// Border
  @override
  ColumnFormat setBorder(String value) {
    for (var cell in _column.cells) {
      cell.theme.setBorder(value);
    }
    return this;
  }

  @override
  ColumnFormat setBorderColor(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setBorderColor(value);
    }
    return this;
  }

  @override
  ColumnFormat setBorderBackground(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setBorderBackground(value);
    }
    return this;
  }

  @override
  ColumnFormat setBorderLeft(String value) {
    for (var cell in _column.cells) {
      cell.theme.setBorderLeft(value);
    }
    return this;
  }

  @override
  ColumnFormat setBorderLeftColor(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setBorderLeftColor(value);
    }
    return this;
  }

  @override
  ColumnFormat setBorderLeftBackground(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setBorderLeftBackground(value);
    }
    return this;
  }

  @override
  ColumnFormat setBorderRight(String value) {
    for (var cell in _column.cells) {
      cell.theme.setBorderRight(value);
    }
    return this;
  }

  @override
  ColumnFormat setBorderRightColor(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setBorderRightColor(value);
    }
    return this;
  }

  @override
  ColumnFormat setBorderRightBackground(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setBorderRightBackground(value);
    }
    return this;
  }

  @override
  ColumnFormat setBorderTop(String value) {
    for (var cell in _column.cells) {
      cell.theme.setBorderTop(value);
    }
    return this;
  }

  @override
  ColumnFormat setBorderTopColor(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setBorderTopColor(value);
    }
    return this;
  }

  @override
  ColumnFormat setBorderTopBackground(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setBorderTopBackground(value);
    }
    return this;
  }

  @override
  ColumnFormat setBorderBottom(String value) {
    for (var cell in _column.cells) {
      cell.theme.setBorderBottom(value);
    }
    return this;
  }

  @override
  ColumnFormat setBorderBottomColor(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setBorderBottomColor(value);
    }
    return this;
  }

  @override
  ColumnFormat setBorderBottomBackground(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setBorderBottomBackground(value);
    }
    return this;
  }

// Corner
  @override
  ColumnFormat setCorner(String value) {
    for (var cell in _column.cells) {
      cell.theme.setCorner(value);
    }
    return this;
  }

  @override
  ColumnFormat setCornerColor(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setCornerColor(value);
    }
    return this;
  }

  @override
  ColumnFormat setCornerBackground(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setCornerBackground(value);
    }
    return this;
  }

// Column separator
  @override
  ColumnFormat setColumnSeparator(String value) {
    for (var cell in _column.cells) {
      cell.theme.setColumnSeparator(value);
    }
    return this;
  }

  @override
  ColumnFormat setColumnSeparatorColor(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setColumnSeparatorColor(value);
    }
    return this;
  }

  @override
  ColumnFormat setColumnSeparatorBackground(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setColumnSeparatorBackground(value);
    }
    return this;
  }

// Font styling
  @override
  ColumnFormat setTextAlign(TextAlign value) {
    for (var cell in _column.cells) {
      cell.theme.setTextAlign(value);
    }
    return this;
  }

  @override
  ColumnFormat setFontStyle(Set<FontStyle> style) {
    for (var cell in _column.cells) {
      cell.theme.setFontStyle(style);
    }
    return this;
  }

  @override
  ColumnFormat setFontColor(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setFontColor(value);
    }
    return this;
  }

  @override
  ColumnFormat setFontBackground(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setFontBackground(value);
    }
    return this;
  }

  @override
  ColumnFormat setColor(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setColor(value);
    }
    return this;
  }

  @override
  ColumnFormat setBackground(Color value) {
    for (var cell in _column.cells) {
      cell.theme.setBackground(value);
    }
    return this;
  }

  final Column _column;
}
