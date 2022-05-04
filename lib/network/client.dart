import 'dart:convert';

import 'package:dart_colorful_cmd/network/server.dart';
import 'package:dio/dio.dart';
import 'package:dart_colorful_cmd/network/networkMethods.dart' as net;
import 'package:dart_colorful_cmd/network/encryption.dart';
import 'package:dart_colorful_cmd/network/decryption.dart';

String labelHostIP;
String _hostIP;
bool hasJoined = false;
// This should be automatic in future
String myIP = '127.0.0.1';
int myID = -1;
List<dynamic> chatMessages = [];
List<dynamic> playerPositions;
int player0Score = 0;
int player1Score = 0;
int player2Score = 0;
int player3Score = 0;
int questionIndex = 0;
void joinGame(String hostIP) async {
  Dio str = new Dio();
  net.JoinGameRequest request = net.JoinGameRequest();
  net.Request req = net.Request(args: [request]);
  _hostIP = hostIP;
  var res = await str.post('http://$_hostIP:239',
      data: encryption(jsonEncode(req.toJson())));

  respond(res);
}

void sendMsg(String msgText) async {
  Dio str = new Dio();

  net.Msg msg = net.Msg(msgText, myID);
  net.Request req = net.Request(args: [msg]);

  var res = await str.post('http://$_hostIP:239',
      data: encryption(jsonEncode(req.toJson())));
  respond(res);
}

void sendCommand(String cmd) async {
  Dio str = new Dio();

  net.Command command = net.Command(cmd, myID);
  net.Request req = net.Request(args: [command]);

  var res = await str.post('http://$_hostIP:239',
      data: encryption(jsonEncode(req.toJson())));
  respond(res);
}

void respond(Response<dynamic> res) {
  if (res.data != '') {
    //print('the server has returned us: $res');
    net.Response response =
        net.Response.fromJson(jsonDecode(decryption(res.data)));
    response.args.forEach((method) {
      switch (method['className']) {
        case 'AllMsg':
          method = net.AllMsg.fromJson(method);
          chatMessages = method.listMsg;
          //print(chatMessages.toList());
          break;
        case 'JoinGameRequest':
          method = net.JoinGameRequest.fromJson(method);
          myID = method.i;
          hasJoined = true;
          break;
        case 'UpdatePlayerPositions':
          method = net.UpdatePlayerPositions.fromJson(method);
          playerPositions = method.playerPositions;
          break;
        case 'UpdateCurrentQuestion':
          method = net.UpdateCurrentQuestion.fromJson(method);
          questionIndex = method.questionIndex;
          break;
        case 'UpdateScores':
          method = net.UpdateScores.fromJson(method);
          player0Score = method.player0Score;
          player1Score = method.player1Score;
          player2Score = method.player2Score;
          player3Score = method.player3Score;
          break;
      }
    });
  } else {
    //print('response was empty');
  }
  //print('${json.encode(chatMessages)} mein hel');
}

void refreshSanity() async {
  Dio str = new Dio();
  net.F5 request = net.F5();
  net.Request req = net.Request(args: [request]);
  var res = await str.post('http://$_hostIP:239',
      data: encryption(jsonEncode(req.toJson())));
  _hostIP = hostIP;
  respond(res);
}

void printMsg(String msg, String sender) {
  print('$sender: $msg');
}
