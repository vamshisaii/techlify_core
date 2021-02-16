import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:global_configuration/global_configuration.dart';

class StorageService {
  static Future<void> store(String key, dynamic value) async {
    final storage = new FlutterSecureStorage();
    await storage.write(key: key, value: value.toString());
  }

  static Future<String> read(String key) async {
    final storage = new FlutterSecureStorage();
    return await storage.read(key: key);
  }

  static Future<void> clear() async {
    final storage = new FlutterSecureStorage();
    await storage.delete(
        key: GlobalConfiguration().getValue<String>('accessTokenKey'));
    await storage.delete(
        key: GlobalConfiguration().getValue<String>('expiryTsKey'));
    await storage.delete(
        key: GlobalConfiguration().getValue<String>('userStoreKey'));
  }
}
