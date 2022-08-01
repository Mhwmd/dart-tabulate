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

`tabulate` is a Dart library to help those who want to create beautiful and high customizable tables in the terminal easly.

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
