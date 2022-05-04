import 'dart:async';
import 'dart:io';

List<int> keyCodes = [];
void toBePrinted(List<int> _keyCodes) {
  // This one mostly supports only single character entry, mostly.
  //keyCodes = _keyCodes;
  // The one below supports multiple character entry a little better. But the problem is none of both can detect 2 characters at the same time. So when the user holds down 'w' and 'a' at the same time, both of the characters will be detected at first but only the last character will stay detected even though the user holds down both of the buttons. This is a constrain but i've had enough of this thing already :/
  keyCodes += _keyCodes;
}

void main() async {
  stdin.echoMode = false;
  stdin.lineMode = false;
  stdin.listen(toBePrinted);
  int i = 0;
  while (true) {
    print("executing");
    keyCodes.forEach((keyCode) {
      // Dart cannot listen to most of the special keys other than space and enter, such as arrow keys.
      print(String.fromCharCode(keyCode));
    });
    keyCodes = [];
    await Future.delayed(Duration(milliseconds: 100));
  }
}
