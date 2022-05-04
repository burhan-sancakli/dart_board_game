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

class JoinGameRequest {
  JoinGameRequest([this.i = 0]);
  final className = 'JoinGameRequest';
  int i;
  Map toJson() => {'className': className, 'i': i};
  factory JoinGameRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException('Null JSON provided to SimpleObject');
    }
    return JoinGameRequest(json['i']);
  }
}

class UpdatePlayerPositions {
  UpdatePlayerPositions(this.playerPositions);
  final className = 'UpdatePlayerPositions';
  List<dynamic> playerPositions;
  Map toJson() => {'className': className, 'playerPositions': playerPositions};
  factory UpdatePlayerPositions.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException('Null JSON provided to SimpleObject');
    }
    return UpdatePlayerPositions(json['playerPositions']);
  }
}

class Command {
  Command(this.command, this.senderID);
  final className = 'Command';
  String command;
  int senderID;
  Map toJson() =>
      {'className': className, 'command': command, 'senderID': senderID};
  factory Command.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException('Null JSON provided to SimpleObject');
    }
    return Command(json['command'], json['senderID']);
  }
}

class ChangePositionPlayer {
  ChangePositionPlayer(this.playerOnTile);
  final className = 'ChangePositionPlayer';
  int playerOnTile;
  Map toJson() => {'className': className, 'playerOnTile': playerOnTile};
  factory ChangePositionPlayer.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException('Null JSON provided to SimpleObject');
    }
    return ChangePositionPlayer(json['playerOnTile']);
  }
}

class UpdateScores {
  UpdateScores(this.player0Score, this.player1Score, this.player2Score,
      this.player3Score);
  final className = 'UpdateScores';
  int player0Score;
  int player1Score;
  int player2Score;
  int player3Score;
  Map toJson() => {
        'className': className,
        'player0Score': player0Score,
        'player1Score': player1Score,
        'player2Score': player2Score,
        'player3Score': player3Score
      };
  factory UpdateScores.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException('Null JSON provided to SimpleObject');
    }
    return UpdateScores(json['player0Score'], json['player1Score'],
        json['player2Score'], json['player3Score']);
  }
}

class UpdateCurrentQuestion {
  UpdateCurrentQuestion(this.questionIndex);
  final className = 'UpdateCurrentQuestion';
  int questionIndex;
  Map toJson() => {'className': className, 'questionIndex': questionIndex};
  factory UpdateCurrentQuestion.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException('Null JSON provided to SimpleObject');
    }
    return UpdateCurrentQuestion(json['questionIndex']);
  }
}

class Msg {
  Msg(this.msg, this.sender);
  final className = 'Msg';
  String msg;
  int sender;
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