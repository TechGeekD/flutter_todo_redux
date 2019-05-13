import 'package:meta/meta.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_todo_redux/models/user.dart';

import 'package:flutter_todo_redux/services/api.dart';
import 'package:flutter_todo_redux/services/storage.dart';

class UsersRepository {
  UsersRepository() {
    this.request = API().request;
  }

  dynamic request;
  final Storage storage = Storage();

  Future getUsersList() async {
    List<User> userList;

    final response = await request(method: 'GET', path: '/users');
    userList = UserList.fromJson(response).users;

    await storage.write(key: 'userList', value: userList);

    return userList;
  }

  Future getUserById({@required String userId}) async {
    final response =
        await request(method: 'GET', path: '/users', query: {'id': userId});
    final User userDetails = User.fromJson(response[0]);

    await storage.write(key: 'userDetails', value: userDetails);
    await storage
        .write(key: 'userAuth', value: {'auth': true, 'token': userDetails.id});

    return userDetails;
  }

  Future<bool> hasToken() async {
    await Future.delayed(Duration(seconds: 1));

    final Map<String, dynamic> userAuth = await storage.read('userAuth');

    return userAuth != null ? userAuth.containsValue(true) : false;
  }
}
