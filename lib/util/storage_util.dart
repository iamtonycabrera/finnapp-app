import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageUtil {
  //**********************INSTANCES**********************//
  final _storage = const FlutterSecureStorage();

  //**********************METHODS**********************//
  /// Write to Firebase storage
  Future<void> write(String key, String value) async {
    return await _storage.write(key: key, value: value);
  }

  /// Read from Firebase storage
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }
}
