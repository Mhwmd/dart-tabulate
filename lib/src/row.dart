import 'package:tabulate/tabulate.dart';

class Row {
  Row();

  final List<Cell> _cells = [];

  void addCell(Cell cell) => _cells.add(cell);

  Cell cellAt(int index) => _cells[index];

  List<Cell> get cells => _cells;

  int get length => _cells.length;

  Cell operator [](int index) => cellAt(index);
}
