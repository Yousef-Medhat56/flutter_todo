import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/models/todo.model.dart';

class TodoTile extends StatelessWidget {
  final Todo todoItem;
  final Function(bool?)? onChanged;
  final void Function(BuildContext)? deleteItem;

  const TodoTile(
      {super.key, required this.todoItem, this.onChanged, this.deleteItem});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          backgroundColor: Colors.red.shade400,
          foregroundColor: Colors.white,
          borderRadius: BorderRadius.circular(4),
          icon: Icons.delete,
          onPressed: deleteItem,
        ),
      ]),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
      ),
    );
  }
}
