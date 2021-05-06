import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  getTodo() async{
    var response = await Dio().get('http://192.168.43.118:8000/todos/');
    print(response);
  }


  @override
  void initState() { 
    super.initState();
    print(getTodo());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo App"),
        ),
        body: Text("Indal"),
      ),
    );

  }
}