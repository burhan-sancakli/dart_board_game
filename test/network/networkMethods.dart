List<T> resizeList<T>(List<T> oldList, int newLength) {
  oldList.length = newLength;
  return oldList;
}

class Request {
  DateTime dtm;
  // dtm is not editable at this moment
  Request({this.dtm, this.args});
  List<dynamic> args;
  Map toJson() => {'dtm': DateTime.now().toString(), 'args': args};
  factory Request.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException('Null JSON provided to SimpleObject');
    }

    return Request(dtm: DateTime.parse(json['dtm']), args: json['args']);
  }
}

class Response {
  DateTime dtm;
  Response({this.dtm, this.args});
  List<dynamic> args;
  int iGlobal;
  int iPeer;
  Map toJson() => {'dtm': DateTime.now().toString(), 'args': args};
  factory Response.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException('Null JSON provided to SimpleObject');
    }

    return Response(dtm: DateTime.parse(json['dtm']), args: json['args']);
  }
}

class F5 {
  F5();
  final className = 'F5';
  Map toJson() => {'className': className};
  factory F5.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException('Null JSON provided to SimpleObject');
    }

    return F5();
  }
}

class Msg {
  Msg(this.msg, this.sender);
  final className = 'Msg';
  String msg;
  String sender;
  Map toJson() => {'className': className, 'msg': msg, 'sender': sender};
  factory Msg.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException('Null JSON provided to SimpleObject');
    }
    return Msg(json['msg'], json['sender']);
  }
}

class AllMsg {
  AllMsg(this.listMsg);
  final className = 'AllMsg';
  List<dynamic> listMsg;
  Map toJson() => {'className': className, 'listMsg': listMsg};
  factory AllMsg.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException('Null JSON provided to SimpleObject');
    }
    return AllMsg(json['listMsg']);
  }
}
/*
class ReindexMsg {
  ReindexMsg(this.iMsg, this.newiMsg);
  final className = 'ReindexMsg';
  String sender;
  int iMsg;
  int newiMsg;
  Map toJson() => {'className': className, 'iMsg': iMsg, 'newiMsg': newiMsg};
  factory ReindexMsg.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException('Null JSON provided to SimpleObject');
    }
    return ReindexMsg(json['iMsg'], json['newiMsg']);
  }
}
*/