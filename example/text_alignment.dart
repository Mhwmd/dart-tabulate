import 'package:tabulate/tabulate.dart';

void main() {
  TermColor.isAnsiColorDisabled = false;
  Table productTable = Table();

  productTable.addRow(["#", "Product Name", "Qty", "Price"]);

  productTable.addRow(["1", "TV", "4", "45,000"]);
  productTable.addRow(["2", "Mobile", "35", "32,000"]);
  productTable.addRow(["3", "Laptop", "12", "90,000"]);
  productTable.addRow(["4", "Keyboard", "3", "3,300"]);
  productTable.addRow(["5", "Shing Mach", "1", "18,500"]);

  productTable.columnAt(0).theme.setTextAlign(TextAlign.center);
  productTable.columnAt(3).theme.setWidth(15).setTextAlign(TextAlign.right);
  productTable.columnAt(2).theme.setWidth(8).setTextAlign(TextAlign.center);

  print(productTable);
}
