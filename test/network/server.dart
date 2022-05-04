import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shelf/shelf.dart';

List<Msg> chatmessages = [];
void main() async {
  HttpServer.bind("0.0.0.0", 239).then((server) => {
        server.listen((HttpRequest request) {
          utf8.decodeStream(request).then((value) => cevap(request, value));
        })
      });
}

cevap(HttpRequest req, String data) {
  Msg tracker = Msg.fromJson(jsonDecode(data));
  tracker.index = chatmessages.length + 1;
  chatmessages.add(tracker);
  req.response.write(chatmessages);
  req.response.close();
}

class Msg {
  Msg({this.message, this.index, this.dtm});
  final classname = "msg";
  String message;
  DateTime dtm;
  int index;
  Map tojson() =>
      {"classname": classname, "message": message, "dtm": dtm, "index": index};
  factory Msg.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to SimpleObject");
    }

    return Msg(
        message: json['message'], dtm: json['dtm'], index: json['index']);
  }
}
