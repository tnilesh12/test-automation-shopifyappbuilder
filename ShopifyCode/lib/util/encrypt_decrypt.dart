import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

import 'package:encrypt/encrypt.dart';

String SdecryptShopname(String encryptedShopname) {

  //final encryptedBase64 = '94oyMvokCZU14jrMk5a7Ol7PsxgV2eGNy4k4SSqUdSw=';

  // Key and IV used in ReactJS
  final keyString = 'cabf2855b596b4846348925d14be2dac'; // 32 bytes key
  final ivString = 'ItgeeksMobilifyA';         // 16 bytes IV

  // Convert key and IV to bytes
  final key = Key.fromUtf8(keyString);
  final iv = IV.fromUtf8(ivString);



  // Decode the base64 encrypted string
  final encryptedBytes = Encrypted.fromBase64(encryptedShopname);

  // Create an AES encrypter instance
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: "PKCS7"));

  // Decrypt the encrypted bytes

  final ens = encrypter.encrypt("test", iv: iv);

  final decrypted = encrypter.decrypt(encryptedBytes, iv: iv);

  print('Decrypted: $decrypted');

  return decrypted;

}


