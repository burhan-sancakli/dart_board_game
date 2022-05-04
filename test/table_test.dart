import 'dart:io';

void main() async {
  List<List<String>> yTable = [];
  await File('assets/img/table_map_smaller.txt')
      .readAsString()
      .then((String contents) {
    List<String> xTable = [];
    contents.split('').forEach((String char) {
      if (char == '\n') {
        yTable.add(xTable);
        // This breaks the code far beyond imagination
        //xTable.clear();
        xTable = [];
      } else {
        xTable.add(char);
      }
    });
    // for the last line
    yTable.add(xTable);
  });
  yTable.forEach((xTable) {
    String buffer = '';
    xTable.forEach((char) {
      buffer += char;
    });
    print(buffer);
  });
  // List<String> tableLines = tableString.split("\n");
  // tableLines.print(tableLines[1]);
}
