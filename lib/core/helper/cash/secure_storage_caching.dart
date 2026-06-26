import 'package:flutter_advanced/core/helper/cash/secure_storage_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageCaching {
  final FlutterSecureStorage _storage;

  SecureStorageCaching(this._storage);

  Future<void> write({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read({required String key}) async {
    return await _storage.read(key: key);
  }

  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  Future<String?> getToken() async {
    return read(key: SecureStorageKeys.token);
  }

  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
