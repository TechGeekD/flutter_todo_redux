import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_todo_redux/redux/actions.dart' show UpdateTodoAction;
import 'package:flutter_todo_redux/redux/app/app_state.dart';

import 'package:flutter_todo_redux/models/loading_status.dart';
import 'package:flutter_todo_redux/models/todo.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        return ListView(
          children: vm.todoList.map(
            (Todo todo) {
              return ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.toys,
                    color: todo.completed ? Colors.lightGreen : null,
                  ),
                  onPressed: () {
                    vm.onCheckboxChanged(todo, !todo.completed);
                  },
                ),
                title: Text(todo.title),
                trailing: Switch(
                  value: todo.completed,
                  onChanged: (value) {
                    vm.onCheckboxChanged(todo, value);
                  },
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}

class _ViewModel {
  final List<Todo> todoList;
  final LoadingStatus loading;
  final Function(Todo, bool) onCheckboxChanged;

  _ViewModel({this.loading, this.todoList, this.onCheckboxChanged});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      todoList: store.state.homeState.todoList,
      loading: store.state.homeState.loadingStatus,
      onCheckboxChanged: (todo, value) {
        store.dispatch(
          UpdateTodoAction(
            todo.id,
            todo.copyWith(
              complete: !todo.completed,
            ),
          ),
        );
      },
    );
  }
}
