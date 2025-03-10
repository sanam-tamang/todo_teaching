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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("To-do"),

          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: TabBar(
              onTap: (index) {
                context.read<TodoCubit>().filter(TodoStatus.values[index]);
              },
              tabs: [
                Tab(child: Text("Pending")),
                Tab(child: Text("Completed")),
              ],
            ),
          ),
        ),
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
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: todo.isCompleted,
                            onChanged: (isCompleted) {
                              context.read<TodoCubit>().update(
                                todo.copyWith(isCompleted: isCompleted),
                              );
                            },
                          ),

                          IconButton(
                            onPressed: () {
                              context.read<TodoCubit>().delete(todo);
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
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
