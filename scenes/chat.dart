import 'package:dart_colorful_cmd/display.dart';
import 'package:dart_colorful_cmd/keyboardInput.dart' as keyboard;
import 'package:dart_colorful_cmd/scene.dart';
import 'package:dart_colorful_cmd/components.dart';

class ChatScene extends Scene {
  String name = 'Chat Menu';
  String description = 'This is where chat functions will be implemented.';

  //
  //
  //
  //
  // This is the designing part
  ChatScene(Display display) : super(display) {
    // BUG: String color declaring isn't working
    addLabel('chat_message',
        text: 'Message will be here: ', r: 0, g: 255, b: 0, transparent: true);
    addLabel('msg', text: '', transparent: true);
  }

  //
  //
  //
  // Updated every frame. Network stuff can be added here.

  @override
  void update() {
    List<int> keyCodes = keyboard.getState();
    keyCodes.forEach((keyCode) {
      int deleteKey = 8;
      int enterKey = 13;
      if (keyCode == deleteKey && labels['msg'].text.isNotEmpty) {
        labels['msg'].text =
            labels['msg'].text.substring(0, labels['msg'].text.length - 1);
      } else if (keyCode == enterKey) {
        // start a new one
      } else {
        String key = String.fromCharCode(keyCode);
        labels['msg'].text += key;
      }
    });
    super.update();
  }
}
