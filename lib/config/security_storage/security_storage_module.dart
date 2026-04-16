import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityStorageModule {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  static Future<void> setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    log(
      "FlutterSecureStorage : setSecuredString with key : $key and value : $value",
    );
    await flutterSecureStorage.write(key: key, value: value);
  }

  static Future<String> getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    log('FlutterSecureStorage : getSecuredString with key :');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  static Future<void> setSecuredBool(String key, bool value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    log("FlutterSecureStorage: setSecuredBool key: $key value: $value");
    await flutterSecureStorage.write(key: key, value: value.toString());
  }

  static Future<bool> getSecuredBool(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    log("FlutterSecureStorage: getSecuredBool key: $key");
    String? value = await flutterSecureStorage.read(key: key);
    return value == 'true';
  }

  static Future<void> deleteSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    log('FlutterSecureStorage : deleteSecuredString with key : $key');
    await flutterSecureStorage.delete(key: key);
  }

  static Future<void> clearAllSecuredData() async {
    log('FlutterSecureStorage : all data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}
