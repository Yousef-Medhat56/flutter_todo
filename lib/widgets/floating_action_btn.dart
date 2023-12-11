import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/models/todo_list.dart';

class FloatingActionBtn extends StatelessWidget {
  const FloatingActionBtn({super.key});

  @override
  Widget build(BuildContext context) {
    void pressSubmitButton(TextEditingController textEditingController) {
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
    }

    void showCreateTaskDialog() {
      TextEditingController textEditingController = TextEditingController();
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Add New Task'),
              content: TextFormField(
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (val) =>
                    pressSubmitButton(textEditingController),
                controller: textEditingController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    labelText: 'Enter Task'),
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
                  onPressed: () => pressSubmitButton(textEditingController),
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
