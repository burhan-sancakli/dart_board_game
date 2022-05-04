import 'package:dart_colorful_cmd/display.dart';
import 'package:dart_colorful_cmd/keyboardInput.dart' as keyboard;
import 'package:dart_colorful_cmd/scene.dart';
import 'package:dart_colorful_cmd/components.dart';

class JoinGameMenu extends Scene {
  String name = "Join Game Menu";
  String description = 'This is the menu to enter an IP to join a game.';

  //
  //
  //
  //
  // This is the designing part
  JoinGameMenu(Display display) : super(display) {
    addLabel('instructIP', text: 'Please enter an ip: ');
    addLabel('enterIP', text: '');
    addButton('joinGameBtn', text: 'Join Game');
  }

  //
  //
  //
  // Updated every frame. Network stuff can be added here.
  @override
  void update() {
    List<int> keyCodes = keyboard.getState();
    keyCodes.forEach((keyCode) {
      String key = String.fromCharCode(keyCode);
      //if (!(key == 'w' || key == 's')) {
      int deleteKey = 8;
      int enterKey = 13;
      if (keyCode == deleteKey && labels['enterIP'].text.isNotEmpty) {
        labels['enterIP'].text = labels['enterIP']
            .text
            .substring(0, labels['enterIP'].text.length - 1);
      } else {
        String key = String.fromCharCode(keyCode);
        labels['enterIP'].text += key;
        labels['enterIP'].text = labels['enterIP'].text.trim();
      }
      // }
    });
    super.update();
  }
}
