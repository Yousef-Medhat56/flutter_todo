class Todo {
  final String taskText;
  bool isCompleted;

  Todo(this.taskText, this.isCompleted);

  void toggleIsCompleted() {
    isCompleted = !isCompleted;
  }
}
