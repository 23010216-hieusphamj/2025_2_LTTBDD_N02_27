import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Task")),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Task name"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(onPressed: () {}, child: const Text("Save Task")),
          ],
        ),
      ),
    );
  }
}
