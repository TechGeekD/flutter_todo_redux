import 'package:redux/redux.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_todo_redux/redux/actions.dart'
    show
        HasAuthenticatedAction,
        AuthenticateAction,
        UnAuthenticateAction,
        AuthenticateSuccessAction,
        AuthenticateFailedAction,
        LoadAuthenticationUserListAction,
        AuthenticationUserListAction,
        AuthenticationLoadingStatusAction,
        NavigateAction;
import 'package:flutter_todo_redux/redux/app/app_state.dart';

import 'package:flutter_todo_redux/models/loading_status.dart';

import 'package:flutter_todo_redux/repository/auth_repository.dart';
import 'package:flutter_todo_redux/repository/user_repository.dart';

import 'package:flutter_todo_redux/ui/index.dart';

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
    store.dispatch(AuthenticationLoadingStatusAction(
        loadingStatus: LoadingStatus.loading));

    final bool hasAuthed = await repository.hasAuthenticated();

    if (hasAuthed) {
      store.dispatch(AuthenticationLoadingStatusAction(
          loadingStatus: LoadingStatus.success));
      return store.dispatch(AuthenticateSuccessAction());
    }

    store.dispatch(NavigateAction(routeName: LoginPage.routeName));
    store.dispatch(
        AuthenticationLoadingStatusAction(loadingStatus: LoadingStatus.error));

    next(action);
  };
}

Middleware<AppState> _createAuthMiddleware({
  @required AuthRepository repository,
}) {
  return (Store store, action, NextDispatcher next) async {
    store.dispatch(AuthenticationLoadingStatusAction(
        loadingStatus: LoadingStatus.loading));

    await repository
        .authenticateUser(
      username: action.username,
      password: action.password,
    )
        .then((user) {
      store.dispatch(AuthenticationLoadingStatusAction(
          loadingStatus: LoadingStatus.success));

      store.dispatch(AuthenticateSuccessAction());
    }).catchError((error) {
      print('Error: $error');
      store.dispatch(AuthenticationLoadingStatusAction(
          loadingStatus: LoadingStatus.error));
      return store.dispatch(AuthenticateFailedAction());
    });

    next(action);
  };
}

Middleware<AppState> _createUnAuthMiddleware({
  @required AuthRepository repository,
}) {
  return (Store store, action, NextDispatcher next) async {
    store.dispatch(AuthenticationLoadingStatusAction(
        loadingStatus: LoadingStatus.loading));

    final bool auth = await repository.unAuthenticateUser();
    if (!auth) {
      store.dispatch(NavigateAction(routeName: LoginPage.routeName));
      store.dispatch(AuthenticationLoadingStatusAction(
          loadingStatus: LoadingStatus.success));
    }

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
    store.dispatch(AuthenticationLoadingStatusAction(
        loadingStatus: LoadingStatus.loading));

    await repository.getUsersList().then((userList) {
      store.dispatch(AuthenticationLoadingStatusAction(
          loadingStatus: LoadingStatus.success));
      store.dispatch(AuthenticationUserListAction(userList: userList));
    }).catchError((error) {
      store.dispatch(AuthenticationLoadingStatusAction(
          loadingStatus: LoadingStatus.error));
      print('Error: $error');
    });

    next(action);
  };
}
