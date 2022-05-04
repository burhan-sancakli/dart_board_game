import 'package:dart_colorful_cmd/display.dart';
import 'package:dart_colorful_cmd/keyboardInput.dart' as keyboard;
import 'package:dart_colorful_cmd/network/server.dart' as server;
import 'package:dart_colorful_cmd/network/client.dart' as client;
import 'package:dart_colorful_cmd/network/networkMethods.dart' as net;
import 'package:dart_colorful_cmd/rozaRegExp.dart';
import 'package:dart_colorful_cmd/scene.dart';
import 'package:dart_colorful_cmd/components.dart';
import 'package:dart_colorful_cmd/networkComponents.dart';

class Question {
  String questionText;
  String answerA;
  String answerB;
  String answerC;
  String answerD;
  String answerE;
  String correctAnswer;
}

class TableScene extends Scene {
  String name = 'Table Scene';
  String description = 'This is where all ingame stuff happens.';

  Question question1 = Question()
    ..questionText = '1) Which one is not an American TV channel?'
    ..answerA = 'PBS'
    ..answerB = 'WIN'
    ..answerC = 'NBC'
    ..answerD = 'FOX'
    ..answerE = 'ABC'
    ..correctAnswer = 'B';
  Question question2 = Question()
    ..questionText = '2) In 1972 the UK joined...'
    ..answerA = 'EEU'
    ..answerB = 'The G7 group'
    ..answerC = 'The Nato'
    ..answerD = 'Eurovision Song Consest'
    ..answerE = 'Soviet Union'
    ..correctAnswer = 'A';
  Question question3 = Question()
    ..questionText = '3) Who wrote Death of the Salesman?'
    ..answerA = 'Georgian Chapman'
    ..answerB = 'William Shakespeare'
    ..answerC = 'Arthur Miller'
    ..answerD = 'George Buchanan'
    ..answerE = 'George Washington'
    ..correctAnswer = 'C';
  Question question4 = Question()
    ..questionText = '4) Who is the current UK Prime Minister?'
    ..answerA = 'John Major'
    ..answerB = 'David Cameron'
    ..answerC = 'David Guetta'
    ..answerD = 'Boris Johnson'
    ..answerE = 'Gordon Brown'
    ..correctAnswer = 'D';
  Question question5 = Question()
    ..questionText =
        '5) Which country is also called the “Land of the Midnight Sun”?'
    ..answerA = 'Japan'
    ..answerB = 'Norway'
    ..answerC = 'Netherlands'
    ..answerD = 'Turkey'
    ..answerE = 'South Africa'
    ..correctAnswer = 'B';
  Question question6 = Question()
    ..questionText = '6) How many rings appear on the Olympic flag?'
    ..answerA = '1'
    ..answerB = '3'
    ..answerC = '5'
    ..answerD = '7'
    ..answerE = '9'
    ..correctAnswer = 'C';
  Question question7 = Question()
    ..questionText =
        '7) How many innings does a baseball game have?How many innings does a baseball game have?'
    ..answerA = '1'
    ..answerB = '3'
    ..answerC = '4'
    ..answerD = '9'
    ..answerE = '6'
    ..correctAnswer = 'D';
  Question question8 = Question()
    ..questionText = "8) What is the name of Mickey Mouse's pet dog?"
    ..answerA = 'Goofy'
    ..answerB = 'Pluto'
    ..answerC = 'Minnie'
    ..answerD = 'Donald'
    ..answerE = 'Bob'
    ..correctAnswer = 'B';
  Question question9 = Question()
    ..questionText =
        '9) What is the atomic sign for Helium on the periodic table?'
    ..answerA = 'H'
    ..answerB = 'He'
    ..answerC = 'De'
    ..answerD = 'Ce'
    ..answerE = 'Le'
    ..correctAnswer = 'B';
  Question question10 = Question()
    ..questionText = '10) What is the currency of Scotland?'
    ..answerA = 'Euro'
    ..answerB = 'Yen'
    ..answerC = 'Pound Sterling'
    ..answerD = 'Gideon'
    ..answerE = 'Rubles'
    ..correctAnswer = 'C';
  Question question11 = Question()
    ..questionText = '11) Where would you find the Taj Mahal?'
    ..answerA = 'China'
    ..answerB = 'India'
    ..answerC = 'Pakistan'
    ..answerD = 'Turkey'
    ..answerE = 'France'
    ..correctAnswer = 'B';
  Question question12 = Question()
    ..questionText = '12) Which music genre are the Bee Gees best known for?'
    ..answerA = 'Disco'
    ..answerB = 'Swing'
    ..answerC = 'Metal'
    ..answerD = 'Jazz'
    ..answerE = 'Rock'
    ..correctAnswer = 'A';
  Question question13 = Question()
    ..questionText =
        "13) Which movie actor uttered the famous words: I'll be back."
    ..answerA = 'Terminator'
    ..answerB = 'Diye Harf'
    ..answerC = 'Batman'
    ..answerD = 'Ironman'
    ..answerE = 'Catwoman'
    ..correctAnswer = 'A';
  Question question14 = Question()
    ..questionText = '14) What is the longest river in the world?'
    ..answerA = 'Nile'
    ..answerB = 'Amazon'
    ..answerC = 'Mississipi'
    ..answerD = 'Yangtze'
    ..answerE = 'Danube'
    ..correctAnswer = 'A';
  Question question15 = Question()
    ..questionText = '15) Which is the largest country (by land area)?'
    ..answerA = 'Russia'
    ..answerB = 'Canada'
    ..answerC = 'Brazil'
    ..answerD = 'India'
    ..answerE = 'China'
    ..correctAnswer = 'A';
  Question question16 = Question()
    ..questionText = '16) Who painted the Mona Lisa?'
    ..answerA = 'Leonardo da Vinci'
    ..answerB = 'Sandro Boticelli'
    ..answerC = 'Caravaggio'
    ..answerD = 'Michelangelo'
    ..answerE = 'Bob'
    ..correctAnswer = 'A';
  Question question17 = Question()
    ..questionText = '17) In which country did the Olympics originate?'
    ..answerA = 'France'
    ..answerB = 'Italy'
    ..answerC = 'Greece'
    ..answerD = 'United States'
    ..answerE = 'China'
    ..correctAnswer = 'C';
  Question question18 = Question()
    ..questionText = '18) Which sport is associated with Wimbledon?'
    ..answerA = 'Golf'
    ..answerB = 'Cricket'
    ..answerC = 'Soccer'
    ..answerD = 'Tennis'
    ..answerE = 'Basketball'
    ..correctAnswer = 'D';
  Question question19 = Question()
    ..questionText = '19) Which planet is the 3rd closest to the sun?'
    ..answerA = 'Mars'
    ..answerB = 'Venus'
    ..answerC = 'Earth'
    ..answerD = 'Jupiter'
    ..answerE = 'Pluto'
    ..correctAnswer = 'C';
  Question question20 = Question()
    ..questionText =
        '20) Which singer told people to "Beat It" and "Heal the World"?'
    ..answerA = 'Madonna'
    ..answerB = 'George Micheal'
    ..answerC = 'Micheal Jackson'
    ..answerD = 'Elton John'
    ..answerE = 'Ibrahim Tatlises'
    ..correctAnswer = 'C';

  List<Question> questions = [];

  //
  //
  //
  //
  // This is the designing part
  Table table;
  //TablePlayerPositions player
  List<dynamic> playerPositions;

  PlayerBubble player0;
  PlayerBubble player1;
  PlayerBubble player2;
  PlayerBubble player3;
  int player0Score = 0;
  int player1Score = 0;
  int player2Score = 0;
  int player3Score = 0;
  int questionIndex = 0;
  bool gameHasEnded = false;
  QuestionBubble questionBubble;
  Chat chat;
  Label win;

  int playerCount;
  bool isClient;
  String hostIP;

  TableScene(Display display, int playerCount,
      {bool isClient = false, this.hostIP = 'localhost'})
      : super(display) {
    questions = [
      question1,
      question2,
      question3,
      question4,
      question5,
      question6,
      question7,
      question8,
      question9,
      question10,
      question11,
      question12,
      question13,
      question14,
      question15,
      question16,
      question17,
      question18,
      question19,
      question20
    ];
    // BUG: String color declaring isn't working
    playerPositions = new List<List<String>>.generate(
        28, (index) => new List<String>.generate(4, (index) => ' '));
    chat = Chat(display);
    table = Table(display);
    questionBubble = QuestionBubble(display,
        question: questions[questionIndex].questionText,
        answerA: questions[questionIndex].answerA,
        answerB: questions[questionIndex].answerB,
        answerC: questions[questionIndex].answerC,
        answerD: questions[questionIndex].answerD,
        answerE: questions[questionIndex].answerE,
        correctAnswer: questions[questionIndex].correctAnswer);
    if (!isClient) {
      server.questionIndex = questionIndex;
    } else {
      questionIndex = client.questionIndex;
    }
    this.playerCount = playerCount;

    player0 = PlayerBubble(display, playerNumber: 1, playerPoint: player0Score);
    //if (playerCount > 1) {
    player1 = PlayerBubble(display, playerNumber: 2, playerPoint: player1Score);
    //}

    playerPositions[0][0] = '1';
    playerPositions[0][1] = '2';
    //if (playerCount > 2) {
    player2 = PlayerBubble(display, playerNumber: 3, playerPoint: player2Score);
    playerPositions[0][2] = '3';
    //}

    //if (playerCount > 3) {
    player3 = PlayerBubble(display, playerNumber: 4, playerPoint: player3Score);
    playerPositions[0][3] = '4';
    //}
    this.isClient = isClient;
    if (isClient) {
      client.joinGame(hostIP);
      client.playerPositions = playerPositions;
      //client.myIP; // CAnt read my own ip from windows dart doesn't have the function, find and rewrite after the presentation.
    } else {
      server.init();
      server.playerPositions = playerPositions;
    }
    this.hostIP = hostIP;
  }

  //
  //
  //
  // Updated every frame. Network stuff can be added here.

  @override
  void update() {
    if (!isClient) {
      processCommands();
    }
    //print(hostIP);
    if (!isClient || client.hasJoined) {
      List<int> keyCodes = keyboard.getState();
      keyCodes.forEach((keyCode) {
        int deleteKey = 8;
        int enterKey = 13;
        if (keyCode == deleteKey) {
          if (chat.input != '') {
            chat.input = chat.input.substring(0, chat.input.length - 1);
          }
        } else if (keyCode == enterKey) {
          bool isCommand;
          if (isClient) {
            isCommand = checkCommand(chat.input, client.myID);
          } else {
            isCommand = checkCommand(chat.input, 0);
          }
          if (isCommand) {
            /* if (isClient) {
              client.sendCommand(chat.input);
            } else {
              checkCommand(chat.input, 0);
            }*/
          } else {
            if (isClient) {
              client.sendMsg(chat.input);
            } else {
              server.sendMsg(chat.input);
            }
          }
          chat.input = '';
        } else {
          String key = String.fromCharCode(keyCode);
          chat.input += key;
        }
      });
      if (isClient) {
        questionIndex = client.questionIndex;
        if (questionIndex < questions.length) {
          questionBubble = QuestionBubble(display,
              question: questions[questionIndex].questionText,
              answerA: questions[questionIndex].answerA,
              answerB: questions[questionIndex].answerB,
              answerC: questions[questionIndex].answerC,
              answerD: questions[questionIndex].answerD,
              answerE: questions[questionIndex].answerE,
              correctAnswer: questions[questionIndex].correctAnswer);
        }
        chat.history.clear();
        client.chatMessages.toList().forEach((var msg) {
          // idont even know why do we have to use msg['sender'] instead of msg.sender
          var chatMessage = ChatMessage(msg['sender'] + 1, msg['msg']);
          chat.history.add(chatMessage);
        });
      } else {
        chat.history.clear();
        server.chatMessages.forEach((var msg) {
          var chatMessage = ChatMessage(msg.sender + 1, msg.msg);
          chat.history.add(chatMessage);
        });
      }
      if (isClient) {
        playerPositions = client.playerPositions;
      } else {
        playerPositions = server.playerPositions;
      }
      table.drawAbstract(0, 0, playerPositions);
      if (isClient) {
        player0Score = client.player0Score;
        player1Score = client.player1Score;
        player2Score = client.player2Score;
        player3Score = client.player3Score;
      }
      player0.playerPoint = player0Score;
      player1.playerPoint = player1Score;
      player2.playerPoint = player2Score;
      player3.playerPoint = player3Score;
      player0.drawAbstract(54, 0);
      player1.drawAbstract(84, 0);
      //if (playerCount > 2) {
      player2.drawAbstract(54, 4);
      //}
      //if (playerCount > 3) {
      player3.drawAbstract(84, 4);
      //}
      questionBubble.drawAbstract(52, 8);
      chat.drawAbstract(52, 15);

      if (isClient && questionIndex >= questions.length) {
        if (player0Score > player1Score &&
            player0Score > player2Score &&
            player0Score > player3Score) {
          winn(0);
        } else if (player1Score > player0Score &&
            player1Score > player2Score &&
            player1Score > player3Score) {
          winn(1);
        } else if (player2Score > player0Score &&
            player2Score > player1Score &&
            player2Score > player3Score) {
          winn(2);
        } else if (player3Score > player0Score &&
            player3Score > player1Score &&
            player3Score > player2Score) {
          winn(3);
        }
      }
    }
    if (win != null && gameHasEnded) {
      win.drawAbstract(20, 20);
    }
    //super.update();
  }

  bool checkCommand(String msg, int senderID) {
    if (isCommandForward(msg)) {
      int playerID;
      if (isClient) {
        client.sendCommand('/forward');
      } else {
        forward(senderID);
      }

      return true;
    } else if (isCommandAnswer(msg)) {
      if (isClient) {
        client.sendCommand(msg);
      } else {
        String answerChar = getAnswer(msg);
        if (answerChar.toLowerCase().trim() ==
            questionBubble.correctAnswer.toLowerCase()) {
          if (senderID == 0) {
            player0Score += 10;
            forward(0);
          } else if (senderID == 1) {
            player1Score += 10;
            forward(1);
          } else if (senderID == 2) {
            player2Score += 10;
            forward(2);
          } else if (senderID == 3) {
            player3Score += 10;
            forward(3);
          }
          nextQuestion();
        }
      }

      return true;
    }
    return false;
  }

  void nextQuestion() {
    if (gameHasEnded) {
      return;
    }
    questionIndex++;
    if (!isClient) {
      server.questionIndex = questionIndex;
      server.player0Score = player0Score;
      server.player1Score = player1Score;
      server.player2Score = player2Score;
      server.player3Score = player3Score;
    }
    if (questionIndex >= questions.length) {
      if (player0Score > player1Score &&
          player0Score > player2Score &&
          player0Score > player3Score) {
        winn(0);
      } else if (player1Score > player0Score &&
          player1Score > player2Score &&
          player1Score > player3Score) {
        winn(1);
      } else if (player2Score > player0Score &&
          player2Score > player1Score &&
          player2Score > player3Score) {
        winn(2);
      } else if (player3Score > player0Score &&
          player3Score > player1Score &&
          player3Score > player2Score) {
        winn(3);
      }
    } else {
      questionBubble = QuestionBubble(display,
          question: questions[questionIndex].questionText,
          answerA: questions[questionIndex].answerA,
          answerB: questions[questionIndex].answerB,
          answerC: questions[questionIndex].answerC,
          answerD: questions[questionIndex].answerD,
          answerE: questions[questionIndex].answerE,
          correctAnswer: questions[questionIndex].correctAnswer);
    }
  }

  void winn(int userID) {
    win = Label(display, text: 'user_${userID} has won!');
    gameHasEnded = true;
  }

  void processCommands() {
    server.receivedCommands.forEach((cmd) {
      checkCommand(cmd.command, cmd.senderID);
    });
    server.receivedCommands.clear();
  }

  @override
  void updateSecond() {
    if (isClient && client.hasJoined) {
      client.refreshSanity();
    }
  }

  // player 0, player 1, player 2, player 3
  // tile0, tile1... tile27
  void setPlayerPosition({int playerID, int tilei}) {
    playerPositions.forEach((tile) {
      tile[playerID] = ' ';
    });
    playerPositions[tilei][playerID] = '${playerID + 1}';
  }

  void forward(int playerID) {
    if (!isClient) {
      for (int i = 0; i < playerPositions.length; i++) {
        if (playerPositions[i][playerID] != ' ') {
          playerPositions[i][playerID] = ' ';
          if (i == playerPositions.length - 1) {
            playerPositions[0][playerID] = '${playerID + 1}';
          } else {
            playerPositions[i + 1][playerID] = '${playerID + 1}';
          }
          break;
        }
      }
      server.playerPositions = playerPositions;
    }
  }
}
