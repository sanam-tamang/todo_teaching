import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/logics/todo_cubit/todo_cubit.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/pages/todo_dialog_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final Todo todo = state.todos[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Card(
                  color: Colors.blueGrey[100],
                  child: ListTile(
                    trailing: Checkbox(
                      value: todo.isCompleted,
                      onChanged: (value) {},
                    ),
                    title: Text(todo.title),
                    subtitle: Text(todo.description),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog, // () => _showDialog()
        child: Icon(Icons.add),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return TodoDialogPage();
      },
    );
  }
}
