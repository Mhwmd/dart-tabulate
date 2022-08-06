import 'package:tabulate/tabulate.dart';

void main() {
  TermColor.isAnsiColorDisabled = false;

  Table styledTable = Table();
  styledTable.addRow(["Bold", "Italic", "Bold & Italic", "Blinking"]);
  styledTable.addRow(["Underline", "Crossed", "Dark", "Bold, Italic & Underlined"]);

  styledTable[0][0].theme.setFontStyle({FontStyle.bold});

  styledTable[0][1].theme.setFontStyle({FontStyle.italic});

  styledTable[0][2].theme.setFontStyle({FontStyle.bold, FontStyle.italic});

  styledTable[0][3].theme.setFontStyle({FontStyle.blink});

  styledTable[1][0].theme.setFontStyle({FontStyle.underline});

  styledTable[1][1].theme.setFontStyle({FontStyle.crossed});

  styledTable[1][2].theme.setFontStyle({FontStyle.dark});

  styledTable[1][3].theme.setFontStyle({FontStyle.bold, FontStyle.italic, FontStyle.underline});

  print(styledTable);
}
