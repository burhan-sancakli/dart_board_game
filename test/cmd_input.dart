import 'dart:io';

void main() {
  stdin.echoMode = false;
  stdin.lineMode = false;

  while (true) {
    // Case sensitive, be careful
    int keyCode = stdin.readByteSync();
    String key = String.fromCharCode(keyCode);
    if (key == "f") {
      print('You payed respect');
    } else {
      print(key);
    }
  }
}
