import 'package:ansicolor/ansicolor.dart';

void colorfulPrint(String buffer,
    {String color,
    String bgColor,
    double r,
    double g,
    double b,
    double bg_r,
    double bg_g,
    double bg_b}) {
  print(colorfulString(buffer,
      color: color,
      bgColor: bgColor,
      r: r,
      g: g,
      b: b,
      bg_r: bg_r,
      bg_g: bg_g,
      bg_b: bg_b));
}

List<double> getRGB(String color) {
  double r, g, b;
  switch (color) {
    case 'black':
      r = 0;
      g = 0;
      b = 0;
      break;
    case 'red':
      r = 255;
      g = 0;
      b = 0;
      break;
    case 'green':
      r = 0;
      g = 255;
      b = 0;
      break;
    case 'blue':
      r = 0;
      g = 0;
      b = 255;
      break;
    case 'yellow':
      r = 255;
      g = 255;
      b = 0;
      break;
    case 'pink':
      r = 255;
      g = 0;
      b = 255;
      break;
    case 'turquoise':
      r = 0;
      g = 255;
      b = 255;
      break;
    default: // white
      r = 255;
      g = 255;
      b = 255;
      break;
  }
  return [r, g, b];
}

String colorfulString(String buffer,
    {String color,
    String bgColor,
    double r = 255,
    double g = 255,
    double b = 255,
    double bg_r,
    double bg_g,
    double bg_b}) {
  var pen = AnsiPen();
  pen.reset();
  if (color != null) {
    List<double> rgb = getRGB(color);
    r = rgb[0];
    g = rgb[1];
    b = rgb[2];
  }
  pen.rgb(r: r, g: g, b: b);
  if (bgColor != null) {
    List<double> rgb = getRGB(bgColor);
    bg_r = rgb[0];
    bg_g = rgb[1];
    bg_b = rgb[2];
  }
  if (bg_r != null && bg_g != null && bg_b != null) {
    pen.rgb(
      r: bg_r,
      g: bg_g,
      b: bg_b,
      bg: true,
    );
  }
  return pen(buffer);
}

/// Due to missing sprintf(), this is my cheap "%03d".
String _toSpace(int i, [int width = 3]) {
  if (width <= 0 && i == 0) return '';
  return '${_toSpace(i ~/ 10, --width)}${i % 10}';
}

/// Return a reference table for foreground and background colors.
String ansi_demo() {
  final sb = StringBuffer();
  final pen = AnsiPen();

  for (var c = 0; c < 16; c++) {
    pen
      ..reset()
      ..white(bold: true)
      ..xterm(c, bg: true);
    sb.write(pen('${_toSpace(c)} '));
    pen
      ..reset()
      ..xterm(c);
    sb.write(pen(' ${_toSpace(c)} '));
    if (c == 7 || c == 15) {
      sb.write('\n');
    }
  }
  return sb.toString();
}
