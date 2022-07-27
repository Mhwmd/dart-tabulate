import 'package:tabulate/tabulate.dart';

class Row extends Iterable<Cell> {
  Row();

  final List<Cell> _cells = [];

  void addCell(Cell cell) => _cells.add(cell);

  Cell cellAt(int index) => _cells[index];

  List<Cell> get cells => _cells;

  Cell operator [](int index) => cellAt(index);

  @override
  Iterator<Cell> get iterator => _cells.iterator;
}
