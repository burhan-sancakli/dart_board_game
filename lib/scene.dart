import 'package:dart_colorful_cmd/display.dart';
import 'package:dart_colorful_cmd/keyboardInput.dart' as keyboard;
import 'package:dart_colorful_cmd/components.dart';

class Scene {
  Display display;
  String name = 'Scene Template';
  String description = 'This is a template scene, everything is a placeholder.';
  Map<String, Label> labels = {};
  Map<String, Button> buttons = {};
  var cursor;
  //bool active = false;  // I think i'm overcomplicating this as of 14:20 16.05
  // Variables from the previous scene will be entered in here
  Scene(Display display) {
    this.display = display;
  }

  // Update should be called every frame
  void update() {
    List<int> keyCodes = keyboard.getState();
    keyCodes.forEach((keyCode) {
      String key = String.fromCharCode(keyCode);
      switch (key.toLowerCase()) {
        case 'w':
          // down-right
          previousCursor();
          break;
        case 's':
          // up-left
          nextCursor();
          break;
        case 'f':
          //display.drawln('You paid respect');
          break;
      }
      switch (keyCode) {
        // enter key
        case 13:
          cursor.click();
      }
    });
    drawLabels();
    drawButtons();
  }

  void updateSecond() {
    // useful for some functions.
    // Second is defined by the frame limiter
  }

  void drawLabels() {
    labels.forEach((name, label) {
      label.drawln();
    });
  }

  void drawButtons() {
    buttons.forEach((name, button) {
      button.drawln();
    });
  }

  void addLabel(String name,
      {String text,
      String color,
      String bgColor,
      double r = 255,
      double g = 255,
      double b = 255,
      double bg_r = 0,
      double bg_g = 0,
      double bg_b = 0,
      bool transparent = true}) {
    labels[name] = Label(display,
        text: text != null ? text : name,
        color: color,
        bgColor: bgColor,
        r: r,
        g: g,
        b: b,
        bg_r: bg_r,
        bg_g: bg_g,
        bg_b: bg_b,
        transparent: transparent);
  }

  void addButton(String name,
      {String text,
      String color,
      String bgColor,
      double r = 255,
      double g = 255,
      double b = 255,
      double bg_r = 0,
      double bg_g = 0,
      double bg_b = 0,
      bool transparent = false,
      bool active = false}) {
    buttons[name] = Button(display,
        text: text != null ? text : name,
        color: color,
        bgColor: bgColor,
        r: r,
        g: g,
        b: b,
        bg_r: bg_r,
        bg_g: bg_g,
        bg_b: bg_b,
        transparent: transparent,
        active: active);
    if (cursor == null) {
      // Could've written previousCursor too. The point is to refresh the cursor.
      nextCursor();
    }
  }

  // Next cursor goes down-right
  void nextCursor() {
    if (buttons.length <= 0) {
      return;
    }
    if (cursor == null) {
      cursor = buttons.values.elementAt(0);
    } else {
      cursor.deactivate();
      var elements;
      if (cursor is Button) {
        elements = buttons.values;
      }
      int lastElementIndex = elements.length - 1;
      for (int i = 0; i <= lastElementIndex; i++) {
        var element = elements.elementAt(i);
        if (cursor == element) {
          if (i == lastElementIndex) {
            cursor = elements.elementAt(0);
          } else {
            cursor = elements.elementAt(i + 1);
          }
          break;
        }
      }
    }
    cursor.activate();
  }

  // Previous cursor goes up-left
  void previousCursor() {
    if (buttons.length <= 0) {
      return;
    }
    if (cursor == null) {
      cursor = buttons.values.elementAt(buttons.length - 1);
      return;
    } else {
      cursor.deactivate();
      var elements;
      if (cursor is Button || cursor == null) {
        elements = buttons.values;
      }
      int lastElementIndex = elements.length - 1;
      for (int i = 0; i <= lastElementIndex; i++) {
        var element = elements.elementAt(i);
        if (cursor == element) {
          if (i == 0) {
            cursor = elements.elementAt(lastElementIndex);
          } else {
            cursor = elements.elementAt(i - 1);
          }
          break;
        }
      }
    }
    cursor.activate();
  }

  void setCursor(element) {
    cursor = element;
  }
}
