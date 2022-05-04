import 'dart:io';

enum keyCodesInt { Enter, Delete }

extension keyCodesIntExtension on keyCodesInt {
  int get name {
    switch (this) {
      case keyCodesInt.Enter:
        return 13;
      case keyCodesInt.Delete:
        return 8;
      default:
        return null;
    }
  }
}

// _ adds invincibility to other classes, so this variable is practically private.
List<int> _keyCodes = [];

List<int> getState() {
  // keyCodes is a completely new copy of _keyCodes, not a pointer to it. This would cause the function to always return an empty fresh list if it was written in Python because keyCodes would be a pointer to the _keyCodes, which immediately gets cleared once it is of no use.
  List<int> keyCodes = _keyCodes;
  //_keyCodes = [];
  return keyCodes;
}

void clearState() {
  _keyCodes = [];
}

void readKeys(List<int> keyCodes) {
  // This one mostly supports only single character entry, mostly.
  //keyCodes = _keyCodes;
  // The one below supports multiple character entry a little better. But the problem is none of both can detect 2 characters at the same time. So when the user holds down 'w' and 'a' at the same time, both of the characters will be detected at first but only the last character will stay detected even though the user holds down both of the buttons. This is a constrain but i've had enough of this thing already :/
  _keyCodes += keyCodes;
}

void initialize() async {
  // stdin.echoMode = false;
  // stdin.lineMode = false;
  stdin.listen(readKeys);
}
