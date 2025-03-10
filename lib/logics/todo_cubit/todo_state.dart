// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_cubit.dart';

class TodoState extends Equatable {
  final List<Todo> todos;
  final TodoStatus status;
  const TodoState({required this.todos, this.status = TodoStatus.pending});

  @override
  List<Object> get props => [todos, status];
}
