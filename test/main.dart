import 'package:dart_colorful_cmd/display.dart';
import 'package:dart_colorful_cmd/keyboardInput.dart' as keyboard;
import 'package:dart_colorful_cmd/components.dart';
import 'package:dart_colorful_cmd/Scene.dart';
import 'package:dart_colorful_cmd/networkComponents.dart';
import 'package:dart_colorful_cmd/network/client.dart';
import 'package:dart_colorful_cmd/network/server.dart';
import '../scenes/mainMenu.dart';
//import '../scenes/chat.dart';
import '../scenes/animation.dart';
import '../scenes/tableScene.dart';
import '../scenes/connectionMenu.dart';
import '../scenes/joinGameMenu.dart';

void main() async {
  Display display = new Display();
  keyboard.initialize(); // must get rid of this somehow

  Map<String, dynamic> activeScenes = {};
  MainMenu mainMenu = MainMenu(display);
  bool isClient = false;
  String hostIP = '127.0.0.1';
  int playerCount = 1;

  TableScene changeToIngame() {
    activeScenes['MainScene'] =
        TableScene(display, playerCount, isClient: isClient, hostIP: hostIP);
  }

  TableScene fromJoinToIngame() {
    hostIP = activeScenes['MainScene'].labels['enterIP'].text;
    return changeToIngame();
  }

  JoinGameMenu joinGameMenuInit() {
    JoinGameMenu joinGameMenu = JoinGameMenu(display);
    String ip = joinGameMenu.labels['enterIP'].text; //maybe trim again?
    hostIP = ip;
    isClient = true;
    joinGameMenu.buttons['joinGameBtn'].onClickCallback = fromJoinToIngame;
    activeScenes['MainScene'] = joinGameMenu;
  }

  ConnectionMenu connectionMenuInit() {
    isClient = false;
    ConnectionMenu connectionMenu = ConnectionMenu(display);
    connectionMenu.buttons['hostGame'].onClickCallback = changeToIngame;
    connectionMenu.buttons['joinGame'].onClickCallback = joinGameMenuInit;
    activeScenes['MainScene'] = connectionMenu;
  }

  void players1() {
    playerCount = 1;
    connectionMenuInit();
  }

  void players2() {
    playerCount = 2;
    connectionMenuInit();
  }

  void players3() {
    playerCount = 3;
    connectionMenuInit();
  }

  void players4() {
    playerCount = 4;
    connectionMenuInit();
  }

  /*mainMenu.buttons['1 players'].onClickCallback = connectionMenuInit;
  mainMenu.buttons['2 players'].onClickCallback = connectionMenuInit;
  mainMenu.buttons['3 players'].onClickCallback = connectionMenuInit;
  mainMenu.buttons['4 players'].onClickCallback = connectionMenuInit;*/
  playerCount = 4;
  activeScenes['MainScene'] = mainMenu;
  connectionMenuInit();

  var fpsLabel = Label(display, text: 'FPS before limit: ', color: 'green');
  // Main loop
  int i = 0;
  int frameLimit = 10;
  while (true) {
    Stopwatch timer = new Stopwatch()..start();
    display.clear();
    activeScenes.forEach((key, scene) {
      scene.update();
      if (i >= frameLimit) {
        scene.updateSecond();
        i = 0;
      }
    });

    // Stuff about rendering
    display.update();
    keyboard.clearState();
    //print('FPS before limit: ${(1000 / timer.elapsedMilliseconds).round()}');
    i++;
    await Future.delayed(
        Duration(milliseconds: 16 - timer.elapsedMilliseconds)); // ~60 fps
  }
}
