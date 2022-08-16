import 'package:dart_tabulate/dart_tabulate.dart';

void main() {
  TermColor.isAnsiColorDisabled = false;

  Table table = Table();

  table.addRow(["No.", "Full Name", "Position", "Salary"]);
  table.addRow(["1", "Bill Gates", "Founder Microsoft", "\$1000"]);
  table.addRow(["2", "Steve Jobs", "Founder Apple", "\$1200"]);
  table.addRow(["3", "Larry Page", "Founder Google", "\$1100"]);
  table.addRow(["4", "Mark Zuckeberg", "Founder Facebook", "\$1300"]);

  table.theme.setBorderColor(Color.white).setFontColor(Color.cyan);

  table[0]
      .theme
      .setFontColor(Color.blue)
      .setTextAlign(TextAlign.center)
      .setFontStyle({FontStyle.bold})
      .setBorderTop("=")
      .setPaddingTop(1)
      .setPaddingBottom(1);

  table.columnAt(0).theme.setTextAlign(TextAlign.center);

  table[4][2].theme.setFontBackground(Color.red).setFontColor(Color.grey).setFontStyle({FontStyle.crossed});

  print(table);
}
