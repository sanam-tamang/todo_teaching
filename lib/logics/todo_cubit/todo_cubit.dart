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
    filter(state.status);
  }

  void delete(Todo todo) {
    _todos = List.from(_todos);
    _todos.remove(todo);
    filter(state.status);
  }

  void update(Todo todo) {
    _todos = List.from(_todos);
    _todos =
        _todos.map((e) {
          if (e.id == todo.id) {
            return todo;
          }
          return e;
        }).toList();

    filter(state.status);
  }

  void filter(TodoStatus status) {
    if (status == TodoStatus.pending) {
      List<Todo> todos = List.from(_todos);

      List<Todo> newTodos = todos.where((e) => !e.isCompleted).toList();

      emit(TodoState(todos: newTodos, status: status));
    } else {
      List<Todo> todos = List.from(_todos);

      List<Todo> newTodos = todos.where((e) => e.isCompleted).toList();

      emit(TodoState(todos: newTodos, status: status));
    }
  }
}

enum TodoStatus { pending, completed }
