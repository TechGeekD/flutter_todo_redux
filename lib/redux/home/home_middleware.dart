import 'package:redux/redux.dart';

import 'package:flutter_todo_redux/redux/actions.dart'
    show LoaderAction, LoadTodosAction, TodosLoadedAction, TodosNotLoadedAction;
import 'package:flutter_todo_redux/redux/app/app_state.dart';

import 'package:flutter_todo_redux/repository/todos_repository.dart';

// import 'package:path_provider/path_provider.dart';
// import 'package:redux_sample/selectors/selectors.dart';

List<Middleware<AppState>> createStoreTodosMiddleware([
  TodosRepository repository,
]) {
  repository = repository ?? TodosRepository();

  // final saveTodos = _createSaveTodos(repository);
  final loadTodos = _createLoadTodos(repository);

  return [
    TypedMiddleware<AppState, LoadTodosAction>(loadTodos),
    // TypedMiddleware<AppState, AddTodoAction>(saveTodos),
    // TypedMiddleware<AppState, ClearCompletedAction>(saveTodos),
    // TypedMiddleware<AppState, ToggleAllAction>(saveTodos),
    // TypedMiddleware<AppState, UpdateTodoAction>(saveTodos),
    // TypedMiddleware<AppState, TodosLoadedAction>(saveTodos),
    // TypedMiddleware<AppState, DeleteTodoAction>(saveTodos),
  ];
}

// Middleware<AppState> _createSaveTodos(TodosRepository repository) {
//   return (Store<AppState> store, action, NextDispatcher next) {
//     next(action);

//     repository.saveTodos(
//       todosSelector(store.state).map((todo) => todo.toEntity()).toList(),
//     );
//   };
// }

Middleware<AppState> _createLoadTodos(TodosRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    store.dispatch(LoaderAction(isLoading: true));

    await repository.loadTodos().then(
      (todos) {
        return store.dispatch(
          TodosLoadedAction(
            todos,
          ),
        );
      },
    ).catchError((error) {
      print('Error: $error');
      return store.dispatch(TodosNotLoadedAction());
    });

    store.dispatch(LoaderAction(isLoading: false));
    next(action);
  };
}
