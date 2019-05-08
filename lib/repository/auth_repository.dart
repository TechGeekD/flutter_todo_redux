import 'package:flutter_todo_redux/models/user.dart';
import 'package:flutter_todo_redux/services/api.dart';
import 'package:flutter_todo_redux/services/storage.dart';
import 'package:meta/meta.dart';

class AuthRepository {
  AuthRepository() {
    this.request = API().request;
  }

  dynamic request;
  final Storage storage = Storage();

  Future<bool> hasAuthenticated() async {
    await Future.delayed(Duration(seconds: 1));

    final Map<String, dynamic> userAuth = await storage.read('userAuth');

    return userAuth != null ? userAuth.containsValue(true) : false;
  }

  Future authenticateUser({
    @required String username,
    @required String password,
  }) async {
    final response = await request(
      method: 'GET',
      path: '/users',
      query: {
        'username': username,
        'id': password,
      },
    );

    final User userDetails = User.fromJson(response[0]);

    await storage.write(
      key: 'userDetails',
      value: userDetails,
    );
    await storage.write(
      key: 'userAuth',
      value: {
        'auth': true,
        'token': userDetails.id,
      },
    );

    return userDetails;
  }

  Future<bool> unAuthenticateUser() async {
    await storage.deleteAll();
    final bool auth = await hasAuthenticated();

    return auth;
  }
}
