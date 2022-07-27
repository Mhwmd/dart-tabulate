import 'package:tabulate/src/theme/theme.dart';
import 'package:tabulate/tabulate.dart';

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
}
