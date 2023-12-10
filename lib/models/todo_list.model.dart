import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo.model.dart';

class TodoList extends ChangeNotifier {
  List<Todo> items = [
    Todo("task 1", false),
    Todo("task 2", true),
    Todo("task 3", false),
    Todo("task 4", false),
  ];

  void addItem(Todo item) {
    items.add(item);
    notifyListeners();
  }

  void deleteItem(int index) {
    items.removeAt(index);
    notifyListeners();
  }

  void toggleTodoIsCompleted(int index) {
    items[index].toggleIsCompleted();
    notifyListeners();
  }
}
