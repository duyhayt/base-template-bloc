part of 'todo_list_bloc.dart';

sealed class TodoListState extends Equatable {
  const TodoListState();

  @override
  List<Object> get props => [];
}

final class TodoListInitial extends TodoListState {
  const TodoListInitial();

  @override
  List<Object> get props => [];
}

final class TodoListLoading extends TodoListState {
  const TodoListLoading();

  @override
  List<Object> get props => [];
}

final class TodoListLoaded extends TodoListState {
  final List<TodoListModel> todoList;
  final List<int> selectedTodoIds;
  const TodoListLoaded(this.todoList, this.selectedTodoIds);

  @override
  List<Object> get props => [todoList, selectedTodoIds];
}

final class TodoListError extends TodoListState {
  final String message;
  const TodoListError(this.message);

  @override
  List<Object> get props => [message];
}
