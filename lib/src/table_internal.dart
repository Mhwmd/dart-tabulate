import 'package:characters/characters.dart';
import 'package:tabulate/tabulate.dart';

import 'printer.dart';
import 'utils.dart';

class TableInternal {
  TableInternal();

  final List<Row> _rows = [];
  final TableTheme _theme = TableTheme()..setDefaults();

  void addRow(List<String> cellsContent) {
    Row row = Row(parent: this);
    for (String content in cellsContent) {
      Cell cell = Cell(data: content, parent: row);
      row.addCell(cell);
    }
    _rows.add(row);
  }

  Column columnAt(int index) {
    Column column = Column();
    for (Row row in _rows) {
      Cell cell = row.cellAt(index);
      column.addCell(cell);
    }
    return column;
  }

  Row rowAt(int index) => _rows[index];

  int get length => _rows.length;

  TableTheme get theme => _theme;

  List<Row> get rows => _rows;

  Row operator [](int index) => rowAt(index);

  void render(StringBuffer stringBuffer) => Printer.renderTable(stringBuffer, this);

  Pair<int, int> shape() {
    Pair<int, int> result = Pair(0, 0);
    StringBuffer stringBuffer = StringBuffer();
    render(stringBuffer);
    String buffer = stringBuffer.toString();
    List<String> lines = splitLines(buffer, "\n");
    if (lines.isNotEmpty) {
      result = Pair(lines[0].characters.length, lines.length);
    }
    return result;
  }

  int estimateNumColumns() {
    int result = 0;
    if (length > 0) {
      var firstRow = rowAt(0);
      result = firstRow.length;
    }
    return result;
  }
}
