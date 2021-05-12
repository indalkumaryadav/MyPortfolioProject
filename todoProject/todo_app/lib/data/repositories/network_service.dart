import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {

  final url = "http://192.168.43.118:8000/todos/";

  Future<List<dynamic>> fetchTodos() async {
    try {
      final response = await http.get(Uri.parse(url));
      return jsonDecode(response.body) as List; 
    } catch (e) {
      return [];
    }
  }

  Future<void> addTodo(String title) async {
    await http.post(Uri.parse(url), body:{
      "title":title
    });
  }
  Future<void> deleteTodo(int id) async {
    await http.delete(Uri.parse("${url}${id}/"));
  }
  
  Future<void> updateTodo(String title,int id) async {
    final data=jsonEncode({
      "id":id,
      "title":title
    });
    print(data);
    await http.put(Uri.parse("${url}${id}/"),headers:{ "Content-Type" : "application/json"},body:data);
  }

}