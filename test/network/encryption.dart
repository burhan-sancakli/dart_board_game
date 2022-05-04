import 'package:encrypt/encrypt.dart';

void main() {
  String randomText = "chaimae";
  String encryptedText = encryption(randomText);
  print(encryptedText);
}

String encryption(String name) {
  Encrypted encryptedText;
  final key = Key.fromLength(32);
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(key));
  encryptedText = encrypter.encrypt(name, iv: iv);
  return encryptedText.base64;
}
