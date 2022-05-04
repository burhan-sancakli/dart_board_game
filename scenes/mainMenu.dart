import 'package:dart_colorful_cmd/display.dart';
import 'package:dart_colorful_cmd/keyboardInput.dart' as keyboard;
import 'package:dart_colorful_cmd/scene.dart';
import 'package:dart_colorful_cmd/components.dart';

class MainMenu extends Scene {
  String name = "Main Menu";
  String description =
      'This is the main navigation menu. Players will be able to navigate through this menu. Design is currently a placeholder.';

  //
  //
  //
  //
  // This is the designing part
  MainMenu(Display display) : super(display) {
    addLabel('welcome_message',
        text:
            'Welcome to monopoly! Please select how many players you want to play with down below:');
    addButton('1 players');
    addButton('2 players');
    addButton('3 players');
    addButton('4 players');
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
