import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import '../widgets/task_card.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b0c0c),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTaskScreen()),
          );
        },
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search tasks...",
                  filled: true,
                  fillColor: Colors.black26,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Today's Tasks", style: TextStyle(fontSize: 18)),
              ),

              const SizedBox(height: 10),

              const TaskCard(title: "UI Design"),
              const TaskCard(title: "English Vocab"),
              const TaskCard(title: "Math Homework"),
              const TaskCard(title: "Clean Desk"),
            ],
          ),
        ),
      ),
    );
  }
}
