import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/models/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  List<Todo> _todos = [];
  TodoCubit() : super(TodoState(todos: []));

  void add(Todo todo) {
    _todos = List.from(_todos);
    _todos.add(todo);
    emit(TodoState(todos: _todos));
  }
}
