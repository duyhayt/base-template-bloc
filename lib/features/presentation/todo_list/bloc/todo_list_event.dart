part of 'todo_list_bloc.dart';

sealed class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class LoadTodoList extends TodoListEvent {
  const LoadTodoList();

  @override
  List<Object> get props => [];
}

class ToggleTodoList extends TodoListEvent {
  final int id;
  const ToggleTodoList(this.id);

  @override
  List<Object> get props => [id];
}

class AddTodoList extends TodoListEvent {
  const AddTodoList();

  @override
  List<Object> get props => [];
}

class UpdateTodoList extends TodoListEvent {
  const UpdateTodoList();

  @override
  List<Object> get props => [];
}

class DeleteTodoList extends TodoListEvent {
  const DeleteTodoList();

  @override
  List<Object> get props => [];
}
