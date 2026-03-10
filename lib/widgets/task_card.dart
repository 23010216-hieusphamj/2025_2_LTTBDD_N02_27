import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;

  const TaskCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black26,
      margin: const EdgeInsets.symmetric(vertical: 8),

      child: ListTile(
        leading: const Icon(Icons.check_box_outline_blank),

        title: Text(title),

        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
