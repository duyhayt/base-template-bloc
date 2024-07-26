import 'package:base_template_bloc/features/presentation/todo_list/models/todo_list_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(const TodoListInitial()) {
    on<TodoListEvent>((event, emit) {});
    on<LoadTodoList>(_fetchTodoList);
    on<ToggleTodoList>(_toggleTodoList);
  }

  Future<void> _fetchTodoList(
    LoadTodoList event,
    Emitter<TodoListState> emit,
  ) async {
    emit(const TodoListLoading());
    try {
      List<TodoListModel> todoList = await Future.delayed(
          const Duration(seconds: 2),
          () => [
                TodoListModel(id: 1, title: "Todo"),
                TodoListModel(id: 2, title: "Todo"),
                TodoListModel(id: 3, title: "Todo"),
                TodoListModel(id: 4, title: "Todo"),
                TodoListModel(id: 5, title: "Todo"),
                TodoListModel(id: 6, title: "Todo"),
                TodoListModel(id: 7, title: "Todo"),
              ]);
      emit(TodoListLoaded(todoList, const []));
    } catch (e) {
      emit(TodoListError(e.toString()));
    }
  }

  Future<void> _toggleTodoList(
    ToggleTodoList event,
    Emitter<TodoListState> emit,
  ) async {
    if (state is TodoListLoaded) {
      final currentState = state as TodoListLoaded;
      final todoList = currentState.todoList;

      // Cập nhật danh sách các ID đã chọn
      final selectedTodoIds = List<int>.from(currentState.selectedTodoIds);
      if (selectedTodoIds.contains(event.id)) {
        selectedTodoIds.remove(event.id); // Bỏ chọn
      } else {
        selectedTodoIds.add(event.id); // Chọn
      }

      emit(TodoListLoaded(todoList, selectedTodoIds));
    }
  }
}
