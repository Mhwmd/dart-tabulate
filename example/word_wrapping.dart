import 'package:dart_tabulate/dart_tabulate.dart';

void main() {
  Table table = Table();

  table.addRow([
    "This paragraph contains a veryveryveryveryveryverylong word. The long word will "
        "break and word wrap to the next line.",
    "This paragraph \nhas embedded '\\n' \ncharacters and\n will break\n exactly "
        "where\n you want it\n to\n break."
  ]);

  table[0][0].theme.setWidth(20);
  table[0][1].theme.setWidth(20);

  print(table);
}
