import 'package:redux/redux.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_todo_redux/redux/actions.dart';
import 'package:flutter_todo_redux/redux/app/app_state.dart';

import 'package:flutter_todo_redux/repository/auth_repository.dart';
import 'package:flutter_todo_redux/repository/user_repository.dart';

import 'package:flutter_todo_redux/ui/index.dart';
import 'package:flutter_todo_redux/ui/home/home.dart';

List<Middleware<AppState>> createAuthMiddleware() {
  final AuthRepository repository = AuthRepository();

  final authUser = _createAuthMiddleware(repository: repository);
  final unAuthUser = _createUnAuthMiddleware(repository: repository);
  final hasAuthed = _createHasAuthedMiddleware(repository: repository);
  final authSuccess = _createAuthSuccessMiddleware(repository: repository);
  final authFailed = _createAuthFailedMiddleware(repository: repository);
  final loadAuthUserList =
      _createLoadAuthUserListMiddleware(repository: UsersRepository());

  return [
    TypedMiddleware<AppState, HasAuthenticatedAction>(hasAuthed),
    TypedMiddleware<AppState, AuthenticateAction>(authUser),
    TypedMiddleware<AppState, UnAuthenticateAction>(unAuthUser),
    TypedMiddleware<AppState, AuthenticateSuccessAction>(authSuccess),
    TypedMiddleware<AppState, AuthenticateFailedAction>(authFailed),
    TypedMiddleware<AppState, LoadAuthenticationUserListAction>(
        loadAuthUserList),
  ];
}

Middleware<AppState> _createHasAuthedMiddleware({
  @required AuthRepository repository,
}) {
  return (Store store, action, NextDispatcher next) async {
    store.dispatch(LoaderAction(isLoading: true));

    final bool hasAuthed = await repository.hasAuthenticated();

    if (hasAuthed) {
      return store.dispatch(AuthenticateSuccessAction());
    }

    store.dispatch(NavigateAction(routeName: LoginPage.routeName));

    store.dispatch(LoaderAction(isLoading: false));
    next(action);
  };
}

Middleware<AppState> _createAuthMiddleware({
  @required AuthRepository repository,
}) {
  return (Store store, action, NextDispatcher next) async {
    store.dispatch(LoaderAction(isLoading: true));

    await repository
        .authenticateUser(
          username: action.username,
          password: action.password,
        )
        .then((user) => store.dispatch(AuthenticateSuccessAction()))
        .catchError((error) {
      print('Error: $error');
      return store.dispatch(AuthenticateFailedAction());
    });

    store.dispatch(LoaderAction(isLoading: false));
    next(action);
  };
}

Middleware<AppState> _createUnAuthMiddleware({
  @required AuthRepository repository,
}) {
  return (Store store, action, NextDispatcher next) async {
    store.dispatch(LoaderAction(isLoading: true));

    final bool auth = await repository.unAuthenticateUser();
    if (!auth) {
      return store.dispatch(NavigateAction(routeName: LoginPage.routeName));
    }

    store.dispatch(LoaderAction(isLoading: false));
    next(action);
  };
}

Middleware<AppState> _createAuthSuccessMiddleware({
  @required AuthRepository repository,
}) {
  return (Store store, action, NextDispatcher next) async {
    store.dispatch(NavigateAction(routeName: HomePage.routeName));

    next(action);
  };
}

Middleware<AppState> _createAuthFailedMiddleware({
  @required AuthRepository repository,
}) {
  return (Store store, action, NextDispatcher next) async {
    next(action);
  };
}

Middleware<AppState> _createLoadAuthUserListMiddleware({
  @required UsersRepository repository,
}) {
  return (Store store, action, NextDispatcher next) async {
    store.dispatch(LoaderAction(isLoading: true));

    await repository.getUsersList().then((userList) {
      return store.dispatch(AuthenticationUserListAction(userList: userList));
    }).catchError((error) {
      print('Error: $error');
    });

    store.dispatch(LoaderAction(isLoading: false));

    next(action);
  };
}
