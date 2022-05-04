import 'package:encrypt/encrypt.dart';

void main() {
  String randomText = "v/2hEc8h7ICkQasdm40pjg==";

  String decryptedText = decryption(randomText);
  print(decryptedText);
}

String decryption(String name) {
  final key = Key.fromLength(32);
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(key));

  String decryptedText = encrypter.decrypt(Encrypted.fromBase64(name), iv: iv);
  return decryptedText;
}
