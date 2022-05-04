import 'dart:async';
import 'dart:io';
import 'dart:convert';

int i = 0;
void main() {
  readLine().listen(processLine);
  print(i);
}

Stream<String> readLine() =>
    stdin.transform(utf8.decoder).transform(const LineSplitter());

void processLine(String line) {
  print(line + "0000");
  i++;
  print(i);
}
