import 'package:dart_tabulate/dart_tabulate.dart';

void main() {
  TermColor.isAnsiColorDisabled = false;
  Table datasetTable = Table();

  datasetTable.addRow([
    "#",
    "Dataset",
    "Modality",
    "Size",
    "Model",
    "CL guessed",
    "MTurk checked",
    "validated",
    "estimated",
    "% error"
  ]);
  datasetTable.addRow([
    "0",
    "MNIST",
    "image",
    "10,000",
    "2-conv CNN",
    "100",
    "100 (100%)",
    "15",
    "-",
    "0.15"
  ]);
  datasetTable.addRow([
    "1",
    "CIFAR-10",
    "image",
    "10,000",
    "VGG",
    "275",
    "275 (100%)",
    "54",
    "-",
    "0.54"
  ]);
  datasetTable.addRow([
    "2",
    "CIFAR-100",
    "image",
    "10,000",
    "VGG",
    "2235",
    "2235 (100%)",
    "585",
    "-",
    "5.85"
  ]);
  datasetTable.addRow([
    "3",
    "Caltech-256",
    "image",
    "36,607",
    "ResNet-152",
    "4,643",
    "400 (8.6%)",
    "65",
    "754",
    "2.46"
  ]);
  datasetTable.addRow([
    "4",
    "ImageNet",
    "image",
    "50,000",
    "ResNet-50",
    "5,440",
    "5,440 (100%)",
    "2,916",
    "-",
    "5.83"
  ]);
  datasetTable.addRow([
    "5",
    "QuickDraw",
    "image",
    "50,426,266",
    "VGG",
    "6,825,383",
    "2,500 (0.04%)",
    "1870",
    "5,105,386",
    "10.120"
  ]);
  datasetTable.addRow([
    "6",
    "20news",
    "text",
    "7,532",
    "TFIDF+SGD",
    "93",
    "93 (100%)",
    "82",
    "-",
    "1.11"
  ]);
  datasetTable.addRow([
    "7",
    "IMDB",
    "text",
    "25,000",
    "FastText",
    "1,310",
    "1,310 (100%)",
    "725",
    "-",
    "2.9"
  ]);
  datasetTable.addRow([
    "8",
    "Amazon",
    "text",
    "9,996,437",
    "FastText",
    "533,249",
    "1,000 (0.2%)",
    "735",
    "390,388",
    "3.9"
  ]);
  datasetTable.addRow([
    "9",
    "AudioSet",
    "audio",
    "20,371",
    "VGG",
    "307",
    "307 (100%)",
    "275",
    "-",
    "1.35"
  ]);

  for (int rowIndex = 2; rowIndex < datasetTable.length; rowIndex++) {
    datasetTable[rowIndex].theme.hideBorderTop();
    if (rowIndex % 2 == 0) datasetTable[rowIndex].theme.setFontColor(Color.red);
  }

  datasetTable.columnAt(0).theme.setFontColor(Color.magenta);
  datasetTable.rowAt(0).theme.setFontStyle(
      {FontStyle.bold, FontStyle.italic}).setFontColor(Color.magenta);
  datasetTable.columnAt(3).theme.setTextAlign(TextAlign.right);
  datasetTable.columnAt(5).theme.setTextAlign(TextAlign.right);
  datasetTable.columnAt(8).theme.setTextAlign(TextAlign.right);
  datasetTable.columnAt(6).theme.setTextAlign(TextAlign.center);
  datasetTable.columnAt(9).theme.setTextAlign(TextAlign.center);

  for (var element in datasetTable[0]) {
    element.theme.setTextAlign(TextAlign.center);
  }

  print(datasetTable);
}
