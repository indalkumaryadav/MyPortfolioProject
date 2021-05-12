import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/screens/HomeScreen.dart';
import 'bloc/todo_bloc.dart';
import 'data/repositories/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => TodoBloc(todoRepository: TodoRepository()),
        child: HomeScreen(),
      ),
      
    );
  }
}
