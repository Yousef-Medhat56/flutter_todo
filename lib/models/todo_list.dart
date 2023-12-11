import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/models/todo.dart';

class TodoList extends ChangeNotifier {
  final _box = Hive.box("todoBox");
  List<Todo>? items;

  TodoList() {
    items = List<Todo>.from(_box.get("TODOLIST") ?? []);
  }

  void addItem(Todo item) {
    items!.add(item);
    _box.put("TODOLIST", items);
    notifyListeners();
  }

  void deleteItem(int index) {
    items!.removeAt(index);
    _box.put("TODOLIST", items);
    notifyListeners();
  }

  void toggleTodoIsCompleted(int index) {
    items![index].toggleIsCompleted();
    _box.put("TODOLIST", items);
    notifyListeners();
  }
}
