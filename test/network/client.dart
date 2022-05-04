import 'dart:convert';

import 'package:dio/dio.dart';

Msg mesagetracker = new Msg(index: 0);
List<Msg> mesajlar = [];
void main() async {
  send();
}

Future<void> send() async {
  Dio str = new Dio();

  while (true) {
    final ress = await str.post("http://localhost:239",
        data: jsonEncode(mesagetracker.tojson()));
    mesagetracker.index = Msg.fromJson(jsonDecode(ress.toString())).index;
  }
}

class Msg {
  Msg({this.message, this.index, this.dtm});
  final classname = "Msg";
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
