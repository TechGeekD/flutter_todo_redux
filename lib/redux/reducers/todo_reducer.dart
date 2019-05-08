import 'package:redux/redux.dart';
import 'package:flutter_todo_redux/redux/actions/index.dart';
import 'package:flutter_todo_redux/models/todo.dart';

final todoReducer = combineReducers<List<Todo>>([
  TypedReducer<List<Todo>, TodosLoadedAction>(_setLoadedTodos),
  TypedReducer<List<Todo>, UpdateTodoAction>(_updateTodo),
  TypedReducer<List<Todo>, DeleteTodoAction>(_deleteTodo),
]);

List<Todo> _setLoadedTodos(List<Todo> todos, TodosLoadedAction action) {
  return action.todos;
}

List<Todo> _updateTodo(List<Todo> todos, UpdateTodoAction action) {
  List<Todo> todoList = todos
      .map(
        (todo) => todo.id == action.id ? action.updatedTodo : todo,
      )
      .toList();

  return todoList;
}

List<Todo> _deleteTodo(List<Todo> todos, DeleteTodoAction action) {
  return todos..removeWhere((todo) => todo.id == action.id);
}
