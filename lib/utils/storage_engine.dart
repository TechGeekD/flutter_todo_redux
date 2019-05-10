import 'dart:async';
import 'dart:typed_data';

import 'package:redux_persist/redux_persist.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Storage engine to save to flutter_secure_storage.
class FlutterSecureStorageEngine implements StorageEngine {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  String key;

  FlutterSecureStorageEngine({this.key});

  @override
  Future<Uint8List> load() async {
    final _storeData = await _secureStorage.read(key: key);

    return stringToUint8List(_storeData);
  }

  @override
  Future<void> save(Uint8List data) async {
    await _secureStorage.write(key: key, value: uint8ListToString(data));

    return data;
  }
}
