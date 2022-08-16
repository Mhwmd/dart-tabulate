import 'package:dart_tabulate/dart_tabulate.dart';

void main() {
  TermColor.isAnsiColorDisabled = false;

  List<MapEntry<String, Color>> colors = [
    MapEntry("Grey", Color.grey),
    MapEntry("Red", Color.red),
    MapEntry("Green", Color.green),
    MapEntry("Yellow", Color.yellow),
    MapEntry("Blue", Color.blue),
    MapEntry("Magenta", Color.magenta),
    MapEntry("Cyan", Color.cyan),
    MapEntry("White", Color.white),
  ];
  List<MapEntry<String, Color>> brightColors = [
    MapEntry("Bright Grey", Color.brightGrey),
    MapEntry("Bright Red", Color.brightRed),
    MapEntry("Bright Green", Color.brightGreen),
    MapEntry("Bright Yellow", Color.brightYellow),
    MapEntry("Bright Blue", Color.brightBlue),
    MapEntry("Bright Magenta", Color.brightMagenta),
    MapEntry("Bright Cyan", Color.brightCyan),
    MapEntry("Bright White", Color.brightWhite),
  ];

  Table colorPalette = Table();

  colorPalette.addRow(colors.map((e) => e.key).toList());
  colorPalette.addRow(List.filled(colors.length, " "));
  colorPalette.addRow(brightColors.map((e) => e.key).toList());
  colorPalette.addRow(List.filled(brightColors.length, " "));

  colorPalette.theme
      .setBackground(Color.brightWhite)
      .setTextAlign(TextAlign.center)
      .setCorner("-")
      .setColor(Color.blue)
      .setWidth(9);

  colorPalette.rowAt(0).theme.setFontColor(Color.grey);
  colorPalette.rowAt(2).theme.setFontColor(Color.grey);

  for (int colorIndex = 0; colorIndex < 8; colorIndex++) {
    colorPalette[1][colorIndex].theme.setFontBackground(colors[colorIndex].value).setHeight(3);
    colorPalette[3][colorIndex].theme.setFontBackground(brightColors[colorIndex].value).setHeight(3);
  }

  Table colorsTable = Table();
  colorsTable.theme
      .setTextAlign(TextAlign.center)
      .setFontStyle({FontStyle.bold})
      .setColor(Color.brightWhite)
      .setFontBackground(Color.magenta);

  colorsTable.addRow(["Color Palette"]);
  colorsTable.addRow([colorPalette]);
  colorsTable.addRow(["Dart tabulate made with ❤ by Mhwmd."]);
  colorsTable.rowAt(2).theme.setFontBackground(Color.grey).setTextAlign(TextAlign.right).hideBorderBottom();
  print("$colorsTable");
}
