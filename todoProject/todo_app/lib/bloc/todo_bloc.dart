import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../data/models/todo.dart';
import '../data/repositories/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;

  TodoBloc({@required this.todoRepository}) : super(TodoLoadInProgress());

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {

     if (event is FetchTodoEvent) {
      yield* _mapTodosLoadedToState();
    }
    else if(event is AddTodoEvent){
      todoRepository.addTodo(event.todo);
      yield* _mapTodosLoadedToState(); 
    }

    else if(event is DeleteTodoEvent){
      todoRepository.deleteTodo(event.id);
      yield* _mapTodosLoadedToState(); 
    }
    else if(event is UpdateTodoEvent){
      todoRepository.updateTodo(event.title,event.id);
      yield* _mapTodosLoadedToState(); 
    } 
  }

  Stream<TodoState> _mapTodosLoadedToState() async* {
      final todos = await this.todoRepository.fetchTodos();
      yield TodoLoadSuccess(todos: todos);
  }

 
}