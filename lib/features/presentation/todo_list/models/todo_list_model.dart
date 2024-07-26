class TodoListModel {
  final int id;
  final String title;
  final bool isDone;
  TodoListModel({required this.id, required this.title, this.isDone = false});

  TodoListModel copyWith({int? id, String? title, bool? isDone}) {
    return TodoListModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }
}
