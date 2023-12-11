import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/models/todo_list.dart';
import 'package:to_do_app/pages/home_page.dart';

void main() async {
  //init hive
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  //open a box
  await Hive.openBox("todoBox");

  runApp(ChangeNotifierProvider(
    create: (context) => TodoList(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.yellow.shade200,
          primary: Colors.yellow.shade600,
          secondary: Colors.yellow.shade800,
          inversePrimary: Colors.white,
        ),
        primarySwatch: Colors.yellow,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
