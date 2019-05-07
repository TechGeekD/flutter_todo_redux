import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final storage = FlutterSecureStorage();

  read(key) async {
    String value = await storage.read(key: key);
    return value != null ? jsonDecode(value) : value;
  }

  readAll() async {
    return await storage.readAll();
  }

  delete(key) async {
    return await storage.delete(key: key);
  }

  deleteAll() async {
    return await storage.deleteAll();
  }

  write({key, value}) async {
    return await storage.write(key: key, value: jsonEncode(value));
  }
}
