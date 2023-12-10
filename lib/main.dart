import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/todo_list.model.dart';
import 'package:to_do_app/pages/home_page.dart';

void main() {
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
      title: 'Flutter Demo',
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
