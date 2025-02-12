import 'package:base_template_bloc/features/presentation/todo_list/bloc/todo_list_bloc.dart';
import 'package:base_template_bloc/injection_container.dart';
import 'package:base_template_bloc/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<TodoListBloc>()..add(const LoadTodoList()),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.brown.shade200,
              title: const Text("Todo List Page"),
            ),
            body: BlocBuilder<TodoListBloc, TodoListState>(
              builder: (context, state) {
                if (state is TodoListLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is TodoListLoaded) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.todoList.length,
                          itemBuilder: (context, index) {
                            final todo = state.todoList[index];
                            final isChecked =
                                state.selectedTodoIds.contains(todo.id);
                            return ListTile(
                              title: Text("${todo.title} : ${todo.id}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              trailing: Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  context
                                      .read<TodoListBloc>()
                                      .add(ToggleTodoList(todo.id));
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
                return const Center(child: Text('No todo list'));
              },
            ),
            bottomNavigationBar: BlocBuilder<TodoListBloc, TodoListState>(
              builder: (context, state) {
                if (state is TodoListLoaded &&
                    state.selectedTodoIds.isNotEmpty) {
                  return Container(
                    margin: const EdgeInsets.all(60.0),
                    child: Button(
                      title: "Delete",
                      onPressed: () {
                        context
                            .read<TodoListBloc>()
                            .add(const DeleteTodoList());
                      },
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            )));
  }
}
