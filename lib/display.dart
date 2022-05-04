import 'dart:io';
import 'package:dart_colorful_cmd/colorfulString.dart';
import 'package:dart_colorful_cmd/components.dart';

final int SCREENSIZE_X = 120;
// screensize_y is not too high because we don't want to annoy the user by having him/her to resize the cmd window everytime he/she wants to play the game.
final int SCREENSIZE_Y = 27;

class Display {
  List<dynamic> buffer = [];
  List<dynamic> postBuffer = [];
  Display([Map<int, int> buffer]) {
    stdin.echoMode = false;
    stdin.lineMode = false;
    hideCursor(); // Hide by default
    if (buffer != null) {
      //this.buffer = buffer;
    }
  }
  void draw(dynamic object) {
    buffer.add(object);
    nextln(); // temporary
  }

  void drawln(dynamic object) {
    draw(object);
    nextln();
  }

  void drawAbstract(dynamic object, int x, [int y = 0]) {
    // To do: The components here will be drawn in the specified position regardless if the position is already occupied or not.
    // The position of the component will not be effected from the already existing component, nor will effect the position of it.

    // This will allow for things like popups, visual effects, shaders, or just simply player icons to be seen over the other screen elements.

    // In cmd, every character (even space) occupies the same amount of space horizontally. So the X will essentially be the character count, while Y is the line count.
    // Both X and Y will range from 0-∞, but will most likely be limited to something like 80-60 as there is only so much space to fit characters.
    // The ratio of X and Y could be 80x60, just like the industry standard of 800x600 when it comes to pixels instead of characters, but here is a problem: The space of X is much smaller than space of Y, about 0.6 times less, so it could effect the 80-60 resolution ratio proposed.
    List<dynamic> postObject = [object, x, y];
    postBuffer.add(postObject);
  }

  void nextln() {
    buffer.add(Label(this, text: '\n'));
  }

  void hideCursor() {
    stdout.write("\x1B[?25l");
  }

  void showCursor() {
    stdout.write("\x1B[?25h");
  }

  void update() {
    // y, x
    List<List<String>> coloredBuffer = new List<List<String>>.generate(
        SCREENSIZE_Y,
        (index) => new List<String>.generate(SCREENSIZE_X, (index) => ' '));
    int x = 0, y = 0;
    buffer.forEach((object) {
      String color = colorfulString('',
              r: object.r,
              g: object.g,
              b: object.b,
              bg_r: object.bg_r,
              bg_g: object.bg_g,
              bg_b: object.bg_b)
          .replaceAll('\x1B[0m', '');
      for (int i = 0; i < object.text.length; i++) {
        String char = object.text[i];
        if (char.contains('\n')) {
          char = char.replaceAll('\n', '');
          // doesn't matter how many \n are there, we want only 1 line break
          y++;
          x = 0;
        }

        if (i == 0) {
          coloredBuffer[y][x] = color + char;
        } else if (i == object.text.length - 1) {
          coloredBuffer[y][x] = char + '\x1B[0m';
        } else {
          coloredBuffer[y][x] = char;
        }
        if (x == SCREENSIZE_X - 1) {
          x = 0;
          y++;
        } else {
          x++;
        }
      }
    });

    postBuffer.forEach((element) {
      dynamic object = element[0];
      int xStart = element[1], yStart = element[2];
      String color = colorfulString('',
              r: object.r,
              g: object.g,
              b: object.b,
              bg_r: object.bg_r,
              bg_g: object.bg_g,
              bg_b: object.bg_b)
          .replaceAll('\x1B[0m', '');
      int i = 0;
      List<String> text = object.text.split('');
      yLoop:
      for (int y = yStart; y < coloredBuffer.length; y++) {
        for (int x = xStart; x < coloredBuffer[y].length; x++) {
          // Pixel is supposed to be a char but it can also have ansi escape sequences.
          String char = text[i];
          if (char.contains('\n')) {
            char = char.replaceAll('\n', '');
            text[i] = char;
            i++;
            // i dont even know how did this fix everything
            if (i > object.text.length - 1) {
              break yLoop;
            }
            //coloredBuffer[y][x] = '\x1B[0m' + color + char + '\x1B[0m';
            continue yLoop;
            // we want x to stay the same but y to increase, as if we were drawing a box
            //x--;  // im not sure if i should include this or not
          } else if (i == 0) {
            coloredBuffer[y][x] = '\x1B[0m' + color + char + '\x1B[0m';
          } else if (object.text.length - 1 == i) {
            coloredBuffer[y][x] = '\x1B[0m' + color + char + '\x1B[0m';
            // there is no int max in dart :(
            y = coloredBuffer.length;
            break yLoop;
          } else {
            coloredBuffer[y][x] = '\x1B[0m' + color + char + '\x1B[0m';
          }
          i++;
          if (x == SCREENSIZE_X - 1) {
            // we want x to stay the same as it is, but y to increase, as if we were drawing a box
            x = xStart;
            y++;
          }
        }
      }
    });

    String stringBuffer = '';
    coloredBuffer.forEach((y) {
      y.forEach((x) {
        String char = x;
        stringBuffer += x;
      });
      stringBuffer += '\n';
    });
    stdout.write('\x1B[2J\x1B[0;0H' + stringBuffer);
    clear();
  }

  void clear() {
    buffer.clear();
    postBuffer.clear();
    //buffer.write("\x1B[2J\x1B[0;0H");  // idk if this is needed
  }
}
