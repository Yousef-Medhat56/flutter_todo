import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/todo.model.dart';
import 'package:to_do_app/models/todo_list.model.dart';

class FloatingActionBtn extends StatelessWidget {
  const FloatingActionBtn({super.key});

  @override
  Widget build(BuildContext context) {
    void showCreateTaskDialog() {
      TextEditingController textEditingController = TextEditingController();
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Add New Task'),
              content: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Enter Task'),
              ),
              actions: <Widget>[
                MaterialButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                MaterialButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  onPressed: () {
                    // Get the user input value from the TextEditingController
                    String userInput = textEditingController.text;
                    if (userInput.isNotEmpty) {
                      //create new todo item
                      final newTodo = Todo(userInput, false);
                      //add the new item to the list
                      context.read<TodoList>().addItem(newTodo);
                      //close the dialog
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
    }

    return FloatingActionButton(
      onPressed: showCreateTaskDialog,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Colors.black,
      child: const Icon(Icons.add),
    );
  }
}
