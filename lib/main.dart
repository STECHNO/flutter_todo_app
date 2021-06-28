import 'package:flutter/material.dart';
import 'package:flutter_todo_app/todo.dart';

void main() {
  runApp(MyApp());
}

//Todo App made by Saleheen Noor

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}


