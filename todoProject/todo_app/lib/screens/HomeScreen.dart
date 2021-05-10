import 'package:flutter/material.dart';
import 'package:todo_app/bloc/counter_event.dart';
import 'package:todo_app/bloc/todo_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final counterBloc=CounterBloc();

  @override
  void dispose() {
    counterBloc.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Todo'),),
      body: Center(
        child:StreamBuilder(
          initialData: 0,
          stream: counterBloc.conterStream,
          builder: (context,snapshot){
            if(snapshot.hasData){
              return Text('${snapshot.data}');
            }
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(onPressed: (){
            counterBloc.eventSink.add(Increment());
          },child: Icon(Icons.add),),
          FloatingActionButton(onPressed: (){
            counterBloc.eventSink.add(Decrement());
          },child: Icon(Icons.remove),),
        ],
      ),
      )
      ,
    );

  }
}