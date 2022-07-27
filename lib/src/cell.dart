import 'package:characters/characters.dart';

class Cell {
  Cell({String? data}) : _data = data ?? "";

  String _data;

  void setText(String text) => _data = text;

  String getText() => _data;

  int get length => _data.characters.length;
}
