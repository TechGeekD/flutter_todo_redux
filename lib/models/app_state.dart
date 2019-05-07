class AppState {
  final int count;
  final bool isLoading;
  final dynamic todos;

  AppState({this.count = 0, this.isLoading = false, this.todos});

  AppState copyWith({int count, bool isLoading}) {
    return AppState(
      count: count ?? this.count,
      isLoading: isLoading ?? this.isLoading,
      todos: todos ?? this.todos,
    );
  }

  @override
  String toString() {
    return 'AppState {isLoading: $isLoading, count: $count, todo: $todos}';
  }
}
