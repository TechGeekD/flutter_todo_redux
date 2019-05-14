import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_logging/redux_logging.dart';

import 'package:flutter_todo_redux/redux/reducers.dart' show appReducer;
import 'package:flutter_todo_redux/redux/middlewares.dart';
import 'package:flutter_todo_redux/redux/app/app_state.dart';

import 'package:flutter_todo_redux/models/loading_status.dart';

import 'package:flutter_todo_redux/utils/storage_engine.dart';

Future<Store<AppState>> createStore() async {
  final persistor = Persistor<AppState>(
      storage: FlutterSecureStorageEngine(key: 'secureStore'),
      serializer: JsonSerializer<AppState>(AppState.fromJson),
      transforms: Transforms(
        onLoad: [
          (state) => state?.copyWith(
                homeState: state.homeState.copyWith(
                  count: 0,
                  loadingStatus: LoadingStatus.success,
                ),
                authState: state.authState.copyWith(
                  loadingStatus: LoadingStatus.success,
                ),
              ),
        ],
      )
//    debug: true
      );

  // Load initial state
  final initialState = await persistor.load();

  return Store<AppState>(
    appReducer,
    initialState:
        initialState?.authState != null && initialState?.homeState != null
            ? initialState
            : AppState.initial(),
    middleware: [
      ...createStoreTodosMiddleware(),
      ...createAuthMiddleware(),
      createRouteMiddleware(),
      LoggingMiddleware.printer(),
      persistor.createMiddleware(),
    ],
  );
}
