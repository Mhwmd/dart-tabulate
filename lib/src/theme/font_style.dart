import 'package:dart_tabulate/dart_tabulate.dart';

enum FontStyle {
  none,
  bold,
  dark,
  italic,
  underline,
  blink,
  reverse,
  concealed,
  crossed;

  /// return ANSI escape for font style
  String apply() {
    Map<FontStyle, String> ansiFontStyles = {
      FontStyle.none: "",
      FontStyle.bold: TermColor.bold,
      FontStyle.dark: TermColor.dark,
      FontStyle.italic: TermColor.italic,
      FontStyle.underline: TermColor.underline,
      FontStyle.blink: TermColor.blink,
      FontStyle.reverse: TermColor.reverse,
      FontStyle.concealed: TermColor.concealed,
      FontStyle.crossed: TermColor.crossed,
    };

    if (!ansiFontStyles.containsKey(this)) {
      return ansiFontStyles[FontStyle.none]!;
    }

    return ansiFontStyles[this]!;
  }
}
