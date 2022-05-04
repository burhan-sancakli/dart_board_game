import 'package:dart_colorful_cmd/display.dart';
import 'package:dart_colorful_cmd/keyboardInput.dart' as keyboard;
import 'package:dart_colorful_cmd/scene.dart';
import 'package:dart_colorful_cmd/components.dart';

class ConnectionMenu extends Scene {
  String name = "Connection Menu";
  String description =
      'This is the menu to choose whether you will host a game or join an already existing game.';

  //
  //
  //
  //
  // This is the designing part
  ConnectionMenu(Display display) : super(display) {
    addButton('hostGame', text: 'Host Game');
    addButton('joinGame', text: 'Join Game');
  }

  //
  //
  //
  // Updated every frame. Network stuff can be added here.
  @override
  void update() {
    super.update();
  }
}
