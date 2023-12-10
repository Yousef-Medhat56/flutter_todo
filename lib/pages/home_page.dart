import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/todo_list.model.dart';
import 'package:to_do_app/widgets/floating_action_btn.dart';
import 'package:to_do_app/widgets/todo_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoList = context.watch<TodoList>();

    final todoListItems = todoList.items;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text("TO DO"),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
            child: ListView.builder(
                itemCount: todoListItems.length,
                itemBuilder: (context, index) {
                  return TodoTile(
                    todoItem: todoListItems[index],
                    onChanged: (bool) => todoList.toggleTodoIsCompleted(index),
                  );
                })),
        floatingActionButton: const FloatingActionBtn());
  }
}