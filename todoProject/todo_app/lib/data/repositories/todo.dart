import 'dart:convert';
import '../models/todo.dart';
import 'package:http/http.dart' as http;

import 'network_service.dart';

class TodoRepository{
 
  Future<List<Todo>> fetchTodos() async {
    final todosRaw = await NetworkService().fetchTodos();
    return todosRaw.map((e) => Todo.fromJson(e)).toList();
  }

  Future<void> addTodo(String title) async {
    await NetworkService().addTodo(title);
  }
  
  Future<void> deleteTodo(int id) async {
    await NetworkService().deleteTodo(id);
  } 
  Future<void> updateTodo(String title ,int id) async {
    await NetworkService().updateTodo(title,id);
  }

}