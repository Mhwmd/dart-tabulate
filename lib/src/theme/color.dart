import 'package:dart_tabulate/dart_tabulate.dart';

enum Color {
  none,
  grey,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white,
  brightRed,
  brightGreen,
  brightCyan,
  brightMagenta,
  brightBlue,
  brightYellow,
  brightGrey,
  brightWhite;

  /// return ANSI color according to enum value.
  String apply({bool isBackground = false}) {
    Map<Color, Pair<String, String>> ansiColorPairs = {
      Color.none: Pair("", ""),
      Color.grey: Pair(TermColor.grey, TermColor.greyBG),
      Color.red: Pair(TermColor.red, TermColor.redBG),
      Color.green: Pair(TermColor.green, TermColor.greenBG),
      Color.yellow: Pair(TermColor.yellow, TermColor.yellowBG),
      Color.blue: Pair(TermColor.blue, TermColor.blueBG),
      Color.magenta: Pair(TermColor.magenta, TermColor.magentaBG),
      Color.cyan: Pair(TermColor.cyan, TermColor.cyanBG),
      Color.white: Pair(TermColor.white, TermColor.whiteBG),
      Color.brightRed: Pair(TermColor.brightRed, TermColor.brightRedBG),
      Color.brightGreen: Pair(TermColor.brightGreen, TermColor.brightGreenBG),
      Color.brightCyan: Pair(TermColor.brightCyan, TermColor.brightCyanBG),
      Color.brightMagenta:
          Pair(TermColor.brightMagenta, TermColor.brightMagentaBG),
      Color.brightBlue: Pair(TermColor.brightBlue, TermColor.brightBlueBG),
      Color.brightYellow:
          Pair(TermColor.brightYellow, TermColor.brightYellowBG),
      Color.brightGrey: Pair(TermColor.brightGrey, TermColor.brightGreyBG),
      Color.brightWhite: Pair(TermColor.brightWhite, TermColor.brightWhiteBG),
    };

    String getAnsiColor(Pair<String, String> color) =>
        !isBackground ? color.first : color.second;

    if (!ansiColorPairs.containsKey(this))
      return getAnsiColor(ansiColorPairs[Color.none]!);
    return getAnsiColor(ansiColorPairs[this]!);
  }
}
