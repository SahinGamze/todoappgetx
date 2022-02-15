import 'package:flutter/material.dart';

import '../model/Todo.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(todo.userId.toString()),
            Text(todo.title.toString()),
            Checkbox(value: todo.completed, onChanged: (newValue) {}),
          ],
        ),
      ),
    );
  }
}
