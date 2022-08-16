import 'src/supports_ansi.dart'
    if (dart.library.io) 'src/supports_ansi_io.dart'
    if (dart.library.html) 'src/supports_ansi_web.dart';

class TermColor {
  TermColor._privateConstructor();

  static List<String> get colorPrimaries => List.unmodifiable([
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
        brightWhite,
      ]);

  /// Globally turn off or on ANSI escapes.
  /// Note: When environment doesn't support ANSI escapes default is false but can be overridden.
  /// On some IDEs default is false an you must override it to true
  static bool isAnsiColorDisabled = !isAnsiEscapeSupported;

  /// Alert the terminal that the following characters were to be interpreted as a control sequence rather than as plain characters,
  static String get ansiEscape => "\u{1B}[";

  static String buildTerm(int code) =>
      isAnsiColorDisabled ? "" : "$ansiEscape${code}m";

  static String colorize(String color, String text) =>
      isAnsiColorDisabled ? text : "$color$text$reset}";

  /// Reset all colors and options to terminal defaults.
  static String get reset => buildTerm(0);

  static String get bold => buildTerm(1);

  static String get dark => buildTerm(2);

  static String get italic => buildTerm(3);

  static String get underline => buildTerm(4);

  static String get blink => buildTerm(5);

  static String get reverse => buildTerm(7);

  static String get concealed => buildTerm(8);

  static String get crossed => buildTerm(9);

  static String get grey => buildTerm(30);

  static String get red => buildTerm(31);

  static String get green => buildTerm(32);

  static String get yellow => buildTerm(33);

  static String get blue => buildTerm(34);

  static String get magenta => buildTerm(35);

  static String get cyan => buildTerm(36);

  static String get white => buildTerm(37);

  /// Ansi codes that default the terminal's foreground color without
  /// altering the background, when printed.
  static String get resetForeground => buildTerm(39);

  static String get brightGrey => buildTerm(90);

  static String get brightRed => buildTerm(91);

  static String get brightGreen => buildTerm(92);

  static String get brightYellow => buildTerm(93);

  static String get brightBlue => buildTerm(94);

  static String get brightMagenta => buildTerm(95);

  static String get brightCyan => buildTerm(96);

  static String get brightWhite => buildTerm(97);

  static String get greyBG => buildTerm(40);

  static String get redBG => buildTerm(41);

  static String get greenBG => buildTerm(42);

  static String get yellowBG => buildTerm(43);

  static String get blueBG => buildTerm(44);

  static String get magentaBG => buildTerm(45);

  static String get cyanBG => buildTerm(46);

  static String get whiteBG => buildTerm(47);

  ///Ansi codes that default the terminal's background color without
  ///altering the foreground, when printed.
  static String get resetBackground => buildTerm(49);

  static String get brightGreyBG => buildTerm(100);

  static String get brightRedBG => buildTerm(101);

  static String get brightGreenBG => buildTerm(102);

  static String get brightYellowBG => buildTerm(103);

  static String get brightBlueBG => buildTerm(104);

  static String get brightMagentaBG => buildTerm(105);

  static String get brightCyanBG => buildTerm(106);

  static String get brightWhiteBG => buildTerm(107);
}
