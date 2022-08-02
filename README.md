<p align="center">
  <img height="80" src="image/logo.jpg" title="dart-tabulate" alt="tabulate logo"/>  
</p>

<div align="center">
  <strong>Fun table maker</strong>
</div>
<div align="center">
  Tabulate is a Dart library for making beautiful nested tables in the terminal.
</div>

<br />

<p align="center">
  <a href="https://github.com/p-ranav/tabulate/blob/master/LICENSE">
    <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="license"/>
  </a>
  <img src="https://img.shields.io/badge/version-1.0-blue.svg?cacheSeconds=2592000" alt="version"/>
</p>

## Table of Contents

*   [Description](#description)

## Description

`tabulate` help those who want to create beautiful and high customizable tables in the terminal easily.

**NOTE** Tabulate supports Dart `>=2.17.5`.

For quick start just create a `Table` object and call `Table.addRows` to add rows to your table and enojy it.
```dart
import 'package:tabulate/tabulate.dart';

void main() {
  Table table = Table();
  table.addRow(["No.", "Full Name", "Position", "Salary"]);
  table.addRow(["1", "Bill Gates", "Founder Microsoft", "\$1000"]);
  table.addRow(["2", "Steve Jobs", "Founder Apple", "\$1200"]);
  table.addRow(["3", "Larry Page", "Founder Google", "\$1100"]);
  table.addRow(["4", "Mark Zuckeberg", "Founder Facebook", "\$1300"]);
}
```

You can style a table by using the `Table.theme` getter which returns a `TableTheme` object then you are able to change properties of the table, e.g., borders, text styles, colors etc.

```dart
  table.theme
    .setBorderColor(Color.red)
    .setFontColor(Color.cyan);
```

You can access rows in the table using `Table[row_index]` or `Table.rowAt(rowIndex)`. This will return a `Row` object on which you can similarly use getter `Row.theme` to stylize properties of all the cells in that row.

Now, let's stylize the header of the table. The code below will change font color of the cells to `blue`, aligns row content to `center`, applies font style to `bold`, changes border top character to `=` and add padding to the bottom and top of the row content.

```dart
   table[0].theme
      .setFontColor(Color.blue)
      .setTextAlign(TextAlign.center)
      .setFontStyle({FontStyle.bold})
      .setBorderTop("=")
      .setPaddingTop(1)
      .setPaddingBottom(1);
```

Also you can access columns in the table by using `Table.columnAt(columnIndex)`. This will return a `Column` object which you can use the getter `Column.theme` to stylize properties all of the cells of the column.

```dart
   table.columnAt(0).theme
      .setTextAlign(TextAlign.center);
```

By the above code you can see that all of the cells in first column is aligned to `center`.

Now what about to change properties of specfic cell in specfic row or column?

You can easily stylizing use Dart index operators to access specfic cell from a row by using `Table[rowIndex][colIndex]` or from a column by using `Table.columnAt(colIndex)[cellIndex]`.

We want to change properties of cell `Founder FaceBook` in index row `4` and column `2`. So just use `table[4][2]` to change font color to `grey` with font background `red` and font style `crossed`.

**NOTE** To access this cell by column we use `table.columnAt(2)[4]`.

```dart
   table[4][2].theme
    .setFontColor(Color.grey)
    .setFontBackground(Color.red)
    .setFontStyle({FontStyle.crossed});
```
`tabulate` is using Dart `StringBuffer` class for render tables. There is two ways of render tables one way is `StringBuffer` another way is just using Dart built-in `print` function to print the `Table` object.

print using `StringBuffer`:
```dart
   StringBuffer stringBuffer = StringBuffer();
   table.render(stringBuffer);
   print(stringBuffer);
```

**NOTE 1** `tabulate` use `TermColor` class for stylizing and colorizeing fonts. In this class there is an property called `isAnsiColorDisabled` this property will globally `disables` or `enables` **ANSI escapes**. When enviroment doesn't support ANSI escapes `default` is set to `true` and ANSI escapes will not added into the table!. But can be overridden to force ANSI escapes adds to the table.

**NOTE 2** some IDEs default is set to `true` but they support ANSI escapes so you have to manualy set the `TermColor.isAnsiColorDisabled` to `false`.

Final result will be:
<p align="center">
  <img src="image/founders_table.jpg"/>  
</p>
