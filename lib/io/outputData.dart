import 'dart:io';

void main() {}

void output(dynamic object,
    {String filename = 'variable.txt', bool append = false}) {
  if (object is List) {
  } else {
    var file = File('variables.txt');
    var sink = file.openWrite();
    sink.write('FILE ACCESSED ${DateTime.now()}');

    // Close the IOSink to free system resources.
    sink.close();
  }
}
