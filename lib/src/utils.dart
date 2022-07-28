import 'dart:math' as math;

import 'package:characters/characters.dart';
// Helper methods for word wrapping:

// Apply word wrap
// Given an input string and a line length, this will insert \n
// in strategic places in input string and apply word wrapping
String wordWrap(String str, int width) {
  List<String> words = explodeString(str, [" ", "-", "\t"]);
  int currentLineLength = 0;
  String result = "";

  for (int i = 0; i < words.length; ++i) {
    String word = words[i];
    // If adding the new word to the current line would be too long,
    // then put it on a new line (and split it up if it's too long).
    if (currentLineLength + word.characters.length > width) {
      // Only move down to a new line if we have text on the current line.
      // Avoids situation where wrapped whitespace causes emptylines in text.
      if (currentLineLength > 0) {
        result += '\n';
        currentLineLength = 0;
      }

      // If the current word is too long to fit on a line even on it's own then
      // split the word up.
      while (word.characters.length > width) {
        result += "${word.substring(0, width - 1)}-";
        word = word.substring(width - 1);
        result += '\n';
      }

      // Remove leading whitespace from the word so the new line starts flush to the left.
      word = word.trimLeft();
    }
    result += word;
    currentLineLength += word.characters.length;
  }

  return result;
}

List<String> splitLines(String text, String delimiter) {
  List<String> result = [];
  String input = text;
  int pos = 0;
  String token = "";
  while (true) {
    pos = input.indexOf(delimiter);
    if (pos == -1) break;
    token = input.substring(0, pos);
    result.add(token);
    input = input.replaceRange(0, pos + delimiter.length, "");
  }
  if (input.characters.isNotEmpty) result.add(input);

  return result;
}

int indexOfAny(String input, int startIndex, List<String> splitCharacters) {
  List<int> indices = [];
  for (var c in splitCharacters) {
    int index = input.indexOf(c, startIndex);
    if (index != -1) {
      indices.add(index);
    }
  }
  if (indices.isNotEmpty) {
    return indices.reduce(math.min);
  }

  return -1;
}

List<String> explodeString(String input, List<String> splitCharacters) {
  List<String> result = [];
  int startIndex = 0;
  while (true) {
    int index = indexOfAny(input, startIndex, splitCharacters);

    if (index == -1) {
      result.add(input.substring(startIndex));
      break;
    }

    String word = input.substring(startIndex, index);
    String nextCharacter = input.substring(index, index + 1);
// Unlike whitespace, dashes and the like should stick to the word occurring before it.
    if (nextCharacter.trim().isEmpty) {
      result.add(word);
      result.add(nextCharacter);
    } else {
      result.add(word + nextCharacter);
    }
    startIndex = index + 1;
  }

  return result;
}
