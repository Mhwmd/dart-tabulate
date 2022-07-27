import 'package:tabulate/src/theme/theme.dart';
import 'package:tabulate/tabulate.dart';

import 'table_internal.dart';

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
}
