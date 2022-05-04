import 'package:dart_colorful_cmd/colorfulString.dart';

void main(List<String> args) {
  StringBuffer buffer = new StringBuffer();
  buffer.writeln(
      "Welcome to monopoly! Please select how many players you want to play with down below:");
  String option_1 =
      colorfulString("1 player", color: "black", bgColor: "white");
  String option_2 =
      colorfulString("2 player", color: "white", bgColor: "black");
  String option_3 =
      colorfulString("3 player", color: "white", bgColor: "black");
  String option_4 =
      colorfulString("4 player", color: "white", bgColor: "black");

  buffer.writeln(option_1);
  buffer.writeln(option_2);
  buffer.writeln(option_3);
  buffer.writeln(option_4);
  print(buffer.toString());
}
