import 'package:dart_colorful_cmd/display.dart';
import 'package:dart_colorful_cmd/colorfulString.dart';
import 'package:dart_colorful_cmd/networkComponents.dart';

class Component {
  Display display;
  String text;
  dynamic Function() onClickCallback;
  Component(Display display, {String text = 'Example Text'}) {
    this.display = display;
    this.text = text;
  }

  Component draw() {
    display.draw(this);
    return this;
  }

  Component drawln() {
    display.draw(this);
    return this;
  }

  Component drawAbstract([int x = 0, int y = 0]) {
    display.drawAbstract(this, x, y);
    return this;
  }
}

class Label extends Component {
  double r, g, b;
  double bg_r, bg_g, bg_b;
  bool transparent;
  Label(Display display,
      {String text = 'example text',
      String color,
      String bgColor,
      double r = 255,
      double g = 255,
      double b = 255,
      double bg_r,
      double bg_g,
      double bg_b,
      bool transparent = true})
      : super(display, text: text) {
    if (color != null) {
      List<double> rgb = getRGB(color);
      this.r = rgb[0];
      this.g = rgb[1];
      this.b = rgb[2];
    } else {
      this.r = r;
      this.g = g;
      this.b = b;
    }
    if (bgColor != null) {
      List<double> rgb = getRGB(bgColor);
      this.bg_r = rgb[0];
      this.bg_g = rgb[1];
      this.bg_b = rgb[2];
    } else if (transparent || (bg_r == null && bg_g == null && bg_b == null)) {
      transparent = true;
    } else {
      this.bg_r = bg_r;
      this.bg_g = bg_g;
      this.bg_b = bg_b;
    }
  }
}

class Button extends Label {
  bool active;
  Button(Display display,
      {String text = 'example text',
      String color,
      String bgColor,
      double r = 255,
      double g = 255,
      double b = 255,
      double bg_r = 0,
      double bg_g = 0,
      double bg_b = 0,
      bool transparent = false,
      bool active = false})
      : super(display,
            text: text,
            color: color,
            bgColor: bgColor,
            r: r,
            g: g,
            b: b,
            bg_r: bg_r,
            bg_b: bg_b,
            bg_g: bg_g,
            transparent: false) {
    this.transparent = transparent;
    this.active = active;
    if (active) {
      activate();
    }
  }

  bool isActive() {
    return active;
  }

  void activate() {
    if (!active) {
      active = true;
      alternateColors();
    }
  }

  void deactivate() {
    if (active) {
      active = false;
      alternateColors();
    }
  }

  void alternateColors() {
    r = (r - 255).abs();
    g = (g - 255).abs();
    b = (b - 255).abs();
    if (!transparent) {
      bg_r = (bg_r - 255).abs();
      bg_g = (bg_g - 255).abs();
      bg_b = (bg_b - 255).abs();
    }
  }

  void onClick(Function() onClickCallback) {
    this.onClickCallback = onClickCallback;
  }

  void click() {
    onClickCallback();
  }
}

class Chat extends Component {
  double r, g, b;
  double bg_r, bg_g, bg_b;
  bool transparent = false;
  String input;
  List<ChatMessage> history;
  Chat(Display display,
      {String input = '',
      List<ChatMessage> history,
      String color,
      String bgColor,
      double r = 255,
      double g = 255,
      double b = 255,
      double bg_r,
      double bg_g,
      double bg_b,
      bool transparent = true})
      : super(display, text: '') {
    if (color != null) {
      List<double> rgb = getRGB(color);
      this.r = rgb[0];
      this.g = rgb[1];
      this.b = rgb[2];
    } else {
      this.r = r;
      this.g = g;
      this.b = b;
    }
    if (bgColor != null) {
      List<double> rgb = getRGB(bgColor);
      this.bg_r = rgb[0];
      this.bg_g = rgb[1];
      this.bg_b = rgb[2];
    } else if (transparent || (bg_r == null && bg_g == null && bg_b == null)) {
      transparent = true;
    } else {
      this.bg_r = bg_r;
      this.bg_g = bg_g;
      this.bg_b = bg_b;
    }
    this.input = input;
    if (history != null) {
      this.history = history;
    } else {
      //this.history = [ChatMessage(0, 'example message by user_0')];
      this.history = [];
    }
  }
  @override
  Component drawAbstract([int x = 0, int y = 0]) {
    // chat input part
    input = input.trimLeft();
    String inputMessage = '${input}';
    List<String> textList = inputMessage.split('');
    text = ' __________________________________________________________\n|';
    for (int y = 0; y < 2; y++) {
      for (int x = 0; x < 58; x++) {
        if (textList.length > 58 * y + x) {
          text += textList[58 * y + x];
        } else {
          text += ' ';
        }
      }
      text += '|\n│';
    }
    for (int x = 0; x < 58; x++) {
      text += '_';
    }
    text += '|\n';

    // chat history part
    text += '';
    String historyText = '';
    int j = 0;
    for (int i = history.length - 1; i >= 0; i--) {
      j++;
      if (j > 7) {
        break;
      }
      ChatMessage message = history[i];
      String messageText = 'user_${message.senderIP}: ${message.text}';
      historyText += messageText + '\n';
    }
    List<String> historyTextList = historyText.split('');

    int i = 0;
    yLoop:
    for (int y = 0; y < 7; y++) {
      text += '|';
      for (int x = 0; x < 58; x++) {
        if (historyTextList.length > i) {
          String char = historyTextList[i];
          if (char == '\n') {
            historyTextList[i] = ' ';
            i++;
            for (; x < 58; x++) {
              text += ' ';
            }
            text += '|\n';
            continue yLoop;
          } else {
            text += char;
          }
          i++;
        } else {
          text += ' ';
        }
      }
      text += '|\n';
    }
    text += ' ';
    for (int x = 0; x < 58; x++) {
      text += '̅';
    }
    display.drawAbstract(this, x, y);
    return this;
  }
}

class Table extends Component {
  double r, g, b;
  double bg_r, bg_g, bg_b;
  bool transparent = false;
  Table(Display display,
      {String color,
      String bgColor,
      double r = 255,
      double g = 255,
      double b = 255,
      double bg_r,
      double bg_g,
      double bg_b,
      bool transparent = true})
      : super(display, text: '') {
    if (color != null) {
      List<double> rgb = getRGB(color);
      this.r = rgb[0];
      this.g = rgb[1];
      this.b = rgb[2];
    } else {
      this.r = r;
      this.g = g;
      this.b = b;
    }
    if (bgColor != null) {
      List<double> rgb = getRGB(bgColor);
      this.bg_r = rgb[0];
      this.bg_g = rgb[1];
      this.bg_b = rgb[2];
    } else if (transparent || (bg_r == null && bg_g == null && bg_b == null)) {
      transparent = true;
    } else {
      this.bg_r = bg_r;
      this.bg_g = bg_g;
      this.bg_b = bg_b;
    }
  }
  @override
  Component drawAbstract([int x = 0, int y = 0, List<dynamic> p]) {
    // chat input part
    text = '';
    text += ' _____ _____ _____ _____ _____ _____ _____ _____\n';
    text += '│     │     │     │     │     │     │     │     │\n';
    text +=
        '│ ${p[0][0]} ${p[0][1]} │ ${p[1][0]} ${p[1][1]} │ ${p[2][0]} ${p[2][1]} │ ${p[3][0]} ${p[3][1]} │ ${p[4][0]} ${p[4][1]} │ ${p[5][0]} ${p[5][1]} │ ${p[6][0]} ${p[6][1]} │ ${p[7][0]} ${p[7][1]} │\n';
    text +=
        '│ ${p[0][2]} ${p[0][3]} │ ${p[1][2]} ${p[1][3]} │ ${p[2][2]} ${p[2][3]} │ ${p[3][2]} ${p[3][3]} │ ${p[4][2]} ${p[4][3]} │ ${p[5][2]} ${p[5][3]} │ ${p[6][2]} ${p[6][3]} │ ${p[7][2]} ${p[7][3]} │\n';
    text += '│̅̅̅̅̅│̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅│̅̅̅̅̅│\n';
    text +=
        '│ ${p[27][0]} ${p[27][1]} │                                   │ ${p[8][0]} ${p[8][1]} │\n';
    text +=
        '│ ${p[27][2]} ${p[27][3]} │                                   │ ${p[8][2]} ${p[8][3]} │\n';
    text += '│̅̅̅̅̅│                                   │̅̅̅̅̅│\n';
    text +=
        '│ ${p[26][0]} ${p[26][1]} │                                   │ ${p[9][0]} ${p[9][1]} │\n';
    text +=
        '│ ${p[26][2]} ${p[26][3]} │                                   │ ${p[9][2]} ${p[9][3]} │\n';
    text += '│̅̅̅̅̅│                                   │̅̅̅̅̅│\n';
    text +=
        '│ ${p[25][0]} ${p[25][1]} │                                   │ ${p[10][0]} ${p[10][1]} │\n';
    text +=
        '│ ${p[25][2]} ${p[25][3]} │                                   │ ${p[10][2]} ${p[10][3]} │\n';
    text += '│̅̅̅̅̅│                                   │̅̅̅̅̅│\n';
    text +=
        '│ ${p[24][0]} ${p[24][1]} │                                   │ ${p[11][0]} ${p[11][1]} │\n';
    text +=
        '│ ${p[24][2]} ${p[24][3]} │                                   │ ${p[11][2]} ${p[11][3]} │\n';
    text += '│̅̅̅̅̅│                                   │̅̅̅̅̅│\n';
    text +=
        '│ ${p[23][0]} ${p[23][1]} │                                   │ ${p[12][0]} ${p[12][1]} │\n';
    text +=
        '│ ${p[23][2]} ${p[23][3]} │                                   │ ${p[12][2]} ${p[12][3]} │\n';
    text += '│̅̅̅̅̅│                                   │̅̅̅̅̅│\n';
    text +=
        '│ ${p[22][0]} ${p[22][1]} │                                   │ ${p[13][0]} ${p[13][1]} │\n';
    text +=
        '│ ${p[22][2]} ${p[22][3]} │                                   │ ${p[13][2]} ${p[13][3]} │\n';
    text += '│̅̅̅̅̅│̅̅̅̅̅│̅̅̅̅̅│̅̅̅̅̅│̅̅̅̅̅│̅̅̅̅̅│̅̅̅̅̅│̅̅̅̅̅│\n';
    text +=
        '│ ${p[21][0]} ${p[21][1]} │ ${p[20][0]} ${p[20][1]} │ ${p[19][0]} ${p[19][1]} │ ${p[18][0]} ${p[18][1]} │ ${p[17][0]} ${p[17][1]} │ ${p[16][0]} ${p[16][1]} │ ${p[15][0]} ${p[15][1]} │ ${p[14][0]} ${p[14][1]} │\n';
    text +=
        '│ ${p[21][2]} ${p[21][3]} │ ${p[20][2]} ${p[20][3]} │ ${p[19][2]} ${p[19][3]} │ ${p[18][2]} ${p[18][3]} │ ${p[17][2]} ${p[17][3]} │ ${p[16][2]} ${p[16][3]} │ ${p[15][2]} ${p[15][3]} │ ${p[14][2]} ${p[14][3]} │\n';
    text += ' ̅̅̅̅̅ ̅̅̅̅̅ ̅̅̅̅̅ ̅̅̅̅̅ ̅̅̅̅̅ ̅̅̅̅̅ ̅̅̅̅̅ ̅̅̅̅̅\n';

    display.drawAbstract(this, x, y);
    return this;
  }
}

class PlayerBubble extends Component {
  int playerNumber;
  int playerPoint;
  double r, g, b;
  double bg_r, bg_g, bg_b;
  bool transparent = false;
  PlayerBubble(Display display,
      {int playerNumber = 1,
      int playerPoint = 0,
      String color,
      String bgColor,
      double r = 255,
      double g = 255,
      double b = 255,
      double bg_r,
      double bg_g,
      double bg_b,
      bool transparent = true})
      : super(display, text: '') {
    if (color != null) {
      List<double> rgb = getRGB(color);
      this.r = rgb[0];
      this.g = rgb[1];
      this.b = rgb[2];
    } else {
      this.r = r;
      this.g = g;
      this.b = b;
    }
    if (bgColor != null) {
      List<double> rgb = getRGB(bgColor);
      this.bg_r = rgb[0];
      this.bg_g = rgb[1];
      this.bg_b = rgb[2];
    } else if (transparent || (bg_r == null && bg_g == null && bg_b == null)) {
      transparent = true;
    } else {
      this.bg_r = bg_r;
      this.bg_g = bg_g;
      this.bg_b = bg_b;
    }
    this.playerNumber = playerNumber;
    this.playerPoint = playerPoint;
  }
  @override
  Component drawAbstract([int x = 0, int y = 0]) {
    // chat input part
    text = ' _    ____________________\n';
    text += '/ \\  │';
    String inputMessage = 'playerPoint:${playerPoint}';
    List<String> textList = inputMessage.split('');
    for (int x = 0; x < 20; x++) {
      if (textList.length > x) {
        text += textList[x];
      } else {
        text += ' ';
      }
    }
    text += '│\n';
    text += '\\_/  │                    │\n';
    text += '/$playerNumber\\  │____________________│';

    display.drawAbstract(this, x, y);
    return this;
  }
}

class QuestionBubble extends Component {
  double r, g, b;
  double bg_r, bg_g, bg_b;
  bool transparent = false;
  String question;
  String answerA;
  String answerB;
  String answerC;
  String answerD;
  String answerE;
  // correctAnswer is actually a character, but casted as a String.
  String correctAnswer;
  QuestionBubble(Display display,
      {this.question =
          'Which country can also called the "Land of the Midnight Sun"?',
      this.answerA = 'Japan',
      this.answerB = 'Netherlands',
      this.answerC = 'United States',
      this.answerD = 'Norway',
      this.answerE = 'South Africa',
      this.correctAnswer = 'D',
      String color,
      String bgColor,
      double r = 255,
      double g = 255,
      double b = 255,
      double bg_r,
      double bg_g,
      double bg_b,
      bool transparent = true})
      : super(display, text: '') {
    if (color != null) {
      List<double> rgb = getRGB(color);
      this.r = rgb[0];
      this.g = rgb[1];
      this.b = rgb[2];
    } else {
      this.r = r;
      this.g = g;
      this.b = b;
    }
    if (bgColor != null) {
      List<double> rgb = getRGB(bgColor);
      this.bg_r = rgb[0];
      this.bg_g = rgb[1];
      this.bg_b = rgb[2];
    } else if (transparent || (bg_r == null && bg_g == null && bg_b == null)) {
      transparent = true;
    } else {
      this.bg_r = bg_r;
      this.bg_g = bg_g;
      this.bg_b = bg_b;
    }
  }
  @override
  Component drawAbstract([int x = 0, int y = 0]) {
    // chat input part
    text = ' __________________________________________________________\n|';
    String inputMessage = '${question}';
    List<String> textList = inputMessage.split('');
    for (int y = 0; y < 2; y++) {
      for (int x = 0; x < 58; x++) {
        if (textList.length > 58 * y + x) {
          text += textList[58 * y + x];
        } else {
          text += ' ';
        }
      }
      text += '|\n│';
    }
    for (int x = 0; x < 58; x++) {
      text += '_';
    }
    text += '|\n|';
    List<String> aList = answerA.split('');
    List<String> bList = answerB.split('');
    List<String> cList = answerC.split('');
    List<String> dList = answerD.split('');
    List<String> eList = answerE.split('');
    for (int y = 0; y < 2; y++) {
      for (int x = 0; x < 11; x++) {
        if (aList.length > 11 * y + x) {
          text += aList[11 * y + x];
        } else {
          text += ' ';
        }
      }
      text += '|';
      for (int x = 0; x < 11; x++) {
        if (bList.length > 11 * y + x) {
          text += bList[11 * y + x];
        } else {
          text += ' ';
        }
      }
      text += '|';
      for (int x = 0; x < 11; x++) {
        if (cList.length > 11 * y + x) {
          text += cList[11 * y + x];
        } else {
          text += ' ';
        }
      }
      text += '|';
      for (int x = 0; x < 11; x++) {
        if (dList.length > 11 * y + x) {
          text += dList[11 * y + x];
        } else {
          text += ' ';
        }
      }
      text += '|';
      for (int x = 0; x < 10; x++) {
        if (eList.length > 10 * y + x) {
          text += eList[10 * y + x];
        } else {
          text += ' ';
        }
      }
      text += '|';
      text += '\n│';
    }
    text = text.substring(0, text.length - 1);
    text += ' ̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅\n';

    display.drawAbstract(this, x, y);
    return this;
  }
}
