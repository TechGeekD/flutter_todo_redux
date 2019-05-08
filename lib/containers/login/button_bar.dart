import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_todo_redux/redux/actions/index.dart';
import 'package:flutter_todo_redux/models/app_state.dart';
import 'package:flutter_todo_redux/models/user.dart';

class ButtonBarWidget extends StatefulWidget {
  ButtonBarWidget(this.userCreds, this.setUserCreds);

  final Function setUserCreds;
  final Map<String, String> userCreds;

  @override
  _ButtonBarWidgetState createState() => _ButtonBarWidgetState();
}

class _ButtonBarWidgetState extends State<ButtonBarWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) => ButtonTheme.bar(
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                UserList(context, widget.setUserCreds),
                FlatButton(
                  child: const Text('Register'),
                  onPressed: () {
                    print('Register');
                  },
                ),
                FlatButton(
                  child: const Text('Login'),
                  onPressed: () {
                    vm.onLoginPressed(
                      username: widget.userCreds['username'],
                      password: widget.userCreds['password'],
                    );
                  },
                ),
              ],
            ),
          ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget UserList(context, setUserCreds) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        return DropdownButton<String>(
          hint: Text('Choose a user'),
          items: vm.userList.map(
            (value) {
              return DropdownMenuItem<String>(
                value: value.id.toString(),
                child: Text(value.username),
              );
            },
          ).toList(),
          onChanged: (newValue) {
            final user = vm.userList.firstWhere((item) {
              return item.id.toString() == newValue;
            });
            setUserCreds('username', user.username);
            setUserCreds('password', user.id);
          },
        );
      },
    );
  }
}

class _ViewModel {
  final List<User> userList;
  final bool loading;
  final Function onLoginPressed;

  _ViewModel({this.loading, this.userList, this.onLoginPressed});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      userList: store.state.userList,
      loading: store.state.isLoading,
      onLoginPressed: ({username, password}) {
        store.dispatch(
          AuthenticateAction(
            username: username,
            password: password,
          ),
        );
      },
    );
  }
}
