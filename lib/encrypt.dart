import 'dart:typed_data';

import 'package:encrypt/encrypt.dart' as Enc;

class Encrypt {

  Uint8List salsaEncode(String plainText, String key) {
    final encKey = Enc.Key.fromUtf8(key.padRight(32, '.'));  // 32 bytes
    final encIV = Enc.IV.fromLength(8);
    final encMaker = Enc.Encrypter(Enc.Salsa20(encKey));

    return encMaker.encrypt(plainText, iv: encIV).bytes;
  }

  String salsaEncodeBase64(String plainText, String key) {
    final encKey = Enc.Key.fromUtf8(key.padRight(32, '.'));  // 32 bytes
    final encIV = Enc.IV.fromLength(8);
    final encMaker = Enc.Encrypter(Enc.Salsa20(encKey));

    return encMaker.encrypt(plainText, iv: encIV).base64;
  }

  Uint8List salsaDecode(Enc.Encrypted encryptedText, String key) {
    final encKey = Enc.Key.fromUtf8(key.padRight(32, '.'));  // 32 bytes
    final encIV = Enc.IV.fromLength(8);
    final encMaker = Enc.Encrypter(Enc.Salsa20(encKey));

    return encMaker.decryptBytes(encryptedText, iv: encIV);
  }

  String salsaDecodeBase64(String encryptedText, String key) {
    final encKey = Enc.Key.fromUtf8(key.padRight(32, '.'));  // 32 bytes
    final encIV = Enc.IV.fromLength(8);
    final encMaker = Enc.Encrypter(Enc.Salsa20(encKey));

    return encMaker.decrypt64(encryptedText, iv: encIV);
  }

}