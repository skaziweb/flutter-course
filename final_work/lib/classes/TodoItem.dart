class TodoItem {
  final int id, userId;
  final String title;
  final bool completed;

  const TodoItem ({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}