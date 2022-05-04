import 'package:dart_colorful_cmd/display.dart';
import 'package:dart_colorful_cmd/keyboardInput.dart' as keyboard;
import 'package:dart_colorful_cmd/scene.dart';
import 'package:dart_colorful_cmd/components.dart';

class Animation extends Scene {
  String name = 'Chat Menu';
  String description = 'This is where chat functions will be implemented.';

  //
  //
  //
  //
  // This is the designing part
  Animation(Display display) : super(display) {
    addLabel('animation', text: '', color: 'red');
  }

  //
  //
  //
  // Updated every frame. Network stuff can be added here.

  @override
  void update() {
    if (labels['animation'].text.length >= 60) {
      labels['animation'].text = '';
    }
    labels['animation'].text += '.';
    drawLabels();
    drawButtons();
  }
}
