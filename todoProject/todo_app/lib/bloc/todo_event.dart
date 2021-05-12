part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent  {}

class FetchTodoEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String todo;
  AddTodoEvent(this.todo);
}

class DeleteTodoEvent extends TodoEvent {
  final int id;
  DeleteTodoEvent(this.id);
}
class UpdateTodoEvent extends TodoEvent {
  final String title;
  final int id;
  UpdateTodoEvent(this.title,this.id);
}