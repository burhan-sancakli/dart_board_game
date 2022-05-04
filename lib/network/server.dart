import 'dart:convert';
import 'dart:io';
import 'package:dart_colorful_cmd/network/client.dart';
import 'package:dart_colorful_cmd/network/networkMethods.dart' as net;
import 'package:dart_colorful_cmd/network/encryption.dart';
import 'package:dart_colorful_cmd/network/decryption.dart';

String hostIP = '127.0.0.1';
String client1IP;
String client2IP;
String client3IP;
int player0Score = 0;
int player1Score = 0;
int player2Score = 0;
int player3Score = 0;
int questionIndex = 0;
Map<String, int> IPtoID = {hostIP: 0};
List<dynamic> playerPositions;
List<net.Command> receivedCommands = [];

List<net.Msg> chatMessages = [];
void init() async {
  HttpServer.bind("0.0.0.0", 239).then((server) => {
        server.listen((HttpRequest request) {
          utf8.decodeStream(request).then((value) => respond(request, value));
        })
      });
}

void sendMsg(String msgText) {
  // Temporarily

  chatMessages.add(net.Msg(msgText, 0));
}

void respond(HttpRequest req, String data) {
  //print('came $data');

  net.Request request = net.Request.fromJson(jsonDecode(decryption(data)));
  net.Response response = net.Response(args: []);
  bool mustRefreshChat = true; // temprorarily always true
  request.args.forEach((method) {
    switch (method['className']) {
      case 'JoinGameRequest':
        method = net.JoinGameRequest.fromJson(method);
        response = acceptPlayer(req, response);
        break;
      case 'Msg':
        method = net.Msg.fromJson(method);
        if (chatMessages.indexOf(method) == -1) {
          chatMessages.add(method);
        }
        mustRefreshChat = true;
        break;
      case 'Command':
        method = net.Command.fromJson(method);
        receivedCommands.add(method);
        mustRefreshChat = true;
        break;
      case 'F5':
        method = net.F5.fromJson(method);
        mustRefreshChat = true;

        break;
    }
  });
  if (mustRefreshChat) {
    response = respondRefresh(req, response);
  }
  //print('server: ${json.encode(response.toJson())}');
  //print(json.encode(chatMessages));
  req.response.write(encryption((json.encode(response.toJson()))));
  //print('our response: ${json.encode(response.toJson())}');
  req.response.close();
}

net.Response respondRefresh(HttpRequest req, net.Response response) {
  //<chat>
  net.AllMsg allMsg = net.AllMsg(chatMessages);
  response.args.add(allMsg);
  //</chat>
  net.UpdatePlayerPositions pp = net.UpdatePlayerPositions(playerPositions);
  response.args.add(pp);

  net.UpdateCurrentQuestion questionUpdate =
      net.UpdateCurrentQuestion(questionIndex);
  response.args.add(questionUpdate);

  net.UpdateScores scoresUpdate =
      net.UpdateScores(player0Score, player1Score, player2Score, player3Score);
  response.args.add(scoresUpdate);
  return response;
}

net.Response acceptPlayer(HttpRequest req, net.Response response) {
  net.JoinGameRequest accept = net.JoinGameRequest();
  String clientIP = req.connectionInfo.remoteAddress.address;
  if (client1IP == null) {
    client1IP = clientIP;
    IPtoID[clientIP] = 1;
    accept.i = 1;
  } else if (client2IP == null) {
    client2IP = clientIP;
    IPtoID[clientIP] = 2;
    accept.i = 2;
  } else if (client3IP == null) {
    client3IP = clientIP;
    IPtoID[clientIP] = 3;
    accept.i = 3;
  } else {
    return response;
  }

  response.args.add(accept);
  return response;
}

void printMsg(String msg, String sender) {
  print('$sender: $msg');
}
