import 'package:tabulate/tabulate.dart';

class Column {
  Column();

  final List<Cell> _cells = [];

  void addCell(Cell cell) => _cells.add(cell);

  Cell cellAt(int index) => _cells[index];

  int get length => _cells.length;

  List<Cell> get cells => _cells;
}
