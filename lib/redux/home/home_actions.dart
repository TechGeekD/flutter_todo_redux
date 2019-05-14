import 'package:flutter_todo_redux/models/loading_status.dart';
import 'package:flutter_todo_redux/models/todo.dart';

class IncrementCountAction {}

class DecrememtCountAction {}

class ClearCompletedAction {}

class ToggleAllAction {}

class LoadTodosAction {}

class TodosNotLoadedAction {}

class TodosLoadedAction {
  final List<Todo> todoList;

  TodosLoadedAction(this.todoList);

  @override
  String toString() {
    return 'TodosLoadedAction {todos: $todoList}';
  }
}

class UpdateTodoAction {
  final int id;
  final Todo updatedTodo;

  UpdateTodoAction(this.id, this.updatedTodo);

  @override
  String toString() {
    return 'UpdateTodoAction{id: $id, updatedTodo: $updatedTodo}';
  }
}

class DeleteTodoAction {
  final int id;

  DeleteTodoAction(this.id);

  @override
  String toString() {
    return 'DeleteTodoAction{id: $id}';
  }
}

class AddTodoAction {
  final Todo todo;

  AddTodoAction(this.todo);

  @override
  String toString() {
    return 'AddTodoAction{todo: $todo}';
  }
}

class HomeLoadingStatusAction {
  HomeLoadingStatusAction({this.loadingStatus});

  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return "HomeLoadingStatusAction {loadingStatus: $loadingStatus}";
  }
}
