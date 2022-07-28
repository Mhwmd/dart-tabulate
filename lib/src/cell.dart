import 'package:characters/characters.dart';
import 'package:tabulate/tabulate.dart';

class Cell {
  Cell({required Row parent, String? data})
      : _parent = parent,
        _data = data ?? "";

  final Row _parent;
  String _data;
  TableTheme? _theme;

  void setText(String text) => _data = text;

  String getText() => _data;

  TableTheme get theme {
    if (_theme == null) {
      _theme = TableTheme.from(_parent.theme);
    } else {
      _theme = TableTheme.merge(_theme!, _parent.theme);
    }
    return _theme!;
  }

  int get length => _data.characters.length;
}
