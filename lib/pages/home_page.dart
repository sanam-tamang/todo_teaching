import 'package:flutter/material.dart';
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
