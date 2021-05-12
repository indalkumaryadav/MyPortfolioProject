part of 'todo_bloc.dart';

@immutable
abstract class TodoState  extends Equatable{}

class TodoLoadInProgress extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoadSuccess extends TodoState {
  final List<Todo> todos;

  TodoLoadSuccess({@required this.todos});

  @override
  List<Object> get props => [todos];

}
