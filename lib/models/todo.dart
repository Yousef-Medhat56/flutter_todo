import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  final String taskText;

  @HiveField(1)
  bool isCompleted;

  Todo(this.taskText, this.isCompleted);

  void toggleIsCompleted() {
    isCompleted = !isCompleted;
  }
}
