import 'package:redux/redux.dart';
import 'package:flutter_todo_redux/redux/actions.dart'
    show
        TodosLoadedAction,
        UpdateTodoAction,
        DeleteTodoAction,
        IncrementCountAction,
        DecrememtCountAction,
        HomeLoadingStatusAction;
import 'package:flutter_todo_redux/redux/home/home_state.dart';

import 'package:flutter_todo_redux/models/todo.dart';

final homeReducer = combineReducers<HomeState>([
  TypedReducer<HomeState, TodosLoadedAction>(_setLoadedTodos),
  TypedReducer<HomeState, UpdateTodoAction>(_updateTodo),
  TypedReducer<HomeState, DeleteTodoAction>(_deleteTodo),
  TypedReducer<HomeState, IncrementCountAction>(_incrementCount),
  TypedReducer<HomeState, DecrememtCountAction>(_decrememtCount),
  TypedReducer<HomeState, HomeLoadingStatusAction>(_setHomeLoadingStatus),
]);

HomeState _setLoadedTodos(HomeState state, TodosLoadedAction action) {
  return state.copyWith(todoList: action.todoList);
}

HomeState _updateTodo(HomeState state, UpdateTodoAction action) {
  List<Todo> todoList = state.todoList
      .map(
        (todo) => todo.id == action.id ? action.updatedTodo : todo,
      )
      .toList();

  return state.copyWith(todoList: todoList);
}

HomeState _deleteTodo(HomeState state, DeleteTodoAction action) {
  final todoList = state.todoList..removeWhere((todo) => todo.id == action.id);

  return state.copyWith(todoList: todoList);
}

HomeState _incrementCount(HomeState state, IncrementCountAction action) {
  return state.copyWith(count: state.count + 1);
}

HomeState _decrememtCount(HomeState state, DecrememtCountAction action) {
  return state.copyWith(count: state.count - 1);
}

HomeState _setHomeLoadingStatus(
  HomeState state,
  HomeLoadingStatusAction action,
) {
  return state.copyWith(loadingStatus: action.loadingStatus);
}
