import 'package:dart_tabulate/dart_tabulate.dart';

import 'table_internal.dart';

class Table extends Iterable<Row> {
  Table();

  final TableInternal _table = TableInternal();
  final List<Type> _supportedTypes = List.unmodifiable([String, Table]);

  int _rows = 0, _cols = 0;

  bool _isNotValidCellType(List<Object> cells) {
    bool isNotSupportType(e) => !_supportedTypes.contains(e.runtimeType);
    return cells.any(isNotSupportType);
  }

  Table addRow(List<Object> cells) {
    if (_isNotValidCellType(cells))
      throw Exception(
          "Unsupported type used supported types are only $_supportedTypes");
    if (_rows == 0) _cols = cells.length;
    final List<String> cellStrings =
        List.filled(cells.length < _cols ? _cols : cells.length, "");

    for (int i = 0; i < cells.length; i++) {
      Object cell = cells[i];
      if (cell is String) {
        cellStrings[i] = cell;
      } else {
        Table table = cell as Table;
        cellStrings[i] = table.toString();
      }
    }

    _table.addRow(cellStrings);
    _rows++;

    return this;
  }

  Column columnAt(int index) => _table.columnAt(index);

  Row rowAt(int index) => _table.rowAt(index);

  List<Row> get rows => _table.rows;

  TableTheme get theme => _table.theme;

  Row operator [](int index) => rowAt(index);

  void render(StringBuffer stringBuffer) => _table.render(stringBuffer);

  Pair<int, int> shape() => _table.shape();

  @override
  Iterator<Row> get iterator => _table.rows.iterator;

  @override
  String toString() {
    StringBuffer stringBuffer = StringBuffer();
    render(stringBuffer);
    return stringBuffer.toString();
  }
}
