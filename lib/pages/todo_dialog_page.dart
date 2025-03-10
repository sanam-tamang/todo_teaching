import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/logics/todo_cubit/todo_cubit.dart';
import 'package:todoapp/models/todo.dart';

class TodoDialogPage extends StatefulWidget {
  const TodoDialogPage({super.key});

  @override
  State<TodoDialogPage> createState() => _TodoDialogPageState();
}

class _TodoDialogPageState extends State<TodoDialogPage> {
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _descriptionTextController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleTextController.dispose();
    _descriptionTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add a todo"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleTextController,

            decoration: InputDecoration(hintText: "Title"),
          ),

          SizedBox(height: 16),
          TextField(
            controller: _descriptionTextController,

            decoration: InputDecoration(hintText: "Description"),
          ),
          SizedBox(height: 24),

          FilledButton(onPressed: _onAdd, child: Text("Save")),
        ],
      ),
    );
  }

  void _onAdd() {
    final Todo todo = Todo(
      id: DateTime.now().toString(),
      title: _titleTextController.text,
      description: _descriptionTextController.text,
    );

    context.read<TodoCubit>().add(todo);

    Navigator.of(context).pop();
  }
}
