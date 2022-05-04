import 'dart:io';

// Burhan has modified the code a bit.
bool isCommandAnswer(String text) {
  final RegExp yo = RegExp(r'(/answer)\s+(a|b|c|d|e)', caseSensitive: false);
  if (yo.hasMatch(text)) {
    return true;
  }
  return false;
}

bool isCommandForward(String text) {
  final RegExp yo = RegExp(r'(/forward)', caseSensitive: false);
  if (yo.hasMatch(text)) {
    return true;
  }
  return false;
}

String getAnswer(String text) {
  final RegExp yo = RegExp(r'(/answer)\s+(a|b|c|d|e)', caseSensitive: false);
  if (yo.hasMatch(text)) {
    var equation = yo.firstMatch(text);
    String answer = equation.group(2).toString();
    //print(answer);
    return answer;
  }
  return '?';
}
