import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() { 
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Todo"),
          ),
          body: ,
          floatingActionButton: FloatingActionButton(
            onPressed: (){},
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}