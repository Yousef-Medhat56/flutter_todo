import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo.model.dart';

class TodoTile extends StatelessWidget {
  final Todo todoItem;
  final Function(bool?)? onChanged;

  const TodoTile({super.key, required this.todoItem, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Checkbox(
            value: todoItem.isCompleted,
            onChanged: onChanged,
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
          Text(
            todoItem.taskText,
            style: TextStyle(
                fontSize: 16,
                decoration: todoItem.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
