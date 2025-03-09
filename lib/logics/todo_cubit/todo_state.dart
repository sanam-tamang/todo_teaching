// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_cubit.dart';

class TodoState extends Equatable {
  final List<Todo> todos;
  const TodoState({
    required this.todos,
  });

  @override
  List<Object> get props => [todos];
}
