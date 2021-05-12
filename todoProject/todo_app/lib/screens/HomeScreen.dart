import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/data/models/todo.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController=TextEditingController();
  TodoBloc todoBloc;
  @override
  void initState() {
    super.initState();
    todoBloc=BlocProvider.of<TodoBloc>(context);
    todoBloc.add(FetchTodoEvent());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Todo"),),
      body: Container(
        child:BlocBuilder<TodoBloc,TodoState>(
          builder: (context,state){
            if(state is TodoLoadInProgress){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(state is TodoLoadSuccess){
              return buildArticleList(state.todos);
            }

          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context,
              builder:(BuildContext context){
                return AlertDialog(
                  title: Text("Add Todo"),
                  content: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      labelText: 'Enter Todo'
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: (){
                        todoBloc.add(AddTodoEvent(textEditingController.text));
                        todoBloc.add(FetchTodoEvent());
                        textEditingController.clear();
                        Navigator.of(context).pop();
                    },
                    child: Text("Add"),)
                  ],
                );
              }
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget buildArticleList(List<Todo> todos) {
  TextEditingController updateTodoController=TextEditingController();
  return ListView.builder(
    itemCount: todos.length,
    itemBuilder: (ctx, pos) {
      return InkWell(
        onTap: (){
          showDialog(
              context:ctx,
              builder:(BuildContext context){
                return AlertDialog(
                  title: Text("Edit Todo"),
                  content: TextField(
                    controller: updateTodoController..text=todos[pos].title,
                  ),
                  actions: [
                    MaterialButton(onPressed: (){
                      BlocProvider.of<TodoBloc>(ctx).add(UpdateTodoEvent(updateTodoController.text.toString(),todos[pos].id));BlocProvider.of<TodoBloc>(ctx).add(FetchTodoEvent());
                      Navigator.of(context).pop();
                    },child: Text("Update"),)
                  ],
                );
              }
          );

        },
        child: Card(
              child: ListTile(
                title: Text(todos[pos].title),
                trailing: IconButton(onPressed: (){
                  showDialog(
                      context:ctx,
                      builder:(BuildContext context){
                        return AlertDialog(
                          title: Text("Delete Todo"),
                          content:Text("are you sure you want to delete?"),
                          actions: [
                            MaterialButton(
                              onPressed: (){
                              Navigator.of(context).pop();
                            },child: Text("Cencel"),),

                            MaterialButton(
                              onPressed: (){
                              BlocProvider.of<TodoBloc>(ctx).add(DeleteTodoEvent(todos[pos].id));
                              BlocProvider.of<TodoBloc>(ctx).add(FetchTodoEvent());

                              Navigator.of(context).pop();
                            },
                            child: Text("Yes"),),
                          ],
                        );
                      }
                  );
                },icon: Icon(Icons.delete_forever),color: Colors.red,),
              ),
        ),
      );
    },
  );
}