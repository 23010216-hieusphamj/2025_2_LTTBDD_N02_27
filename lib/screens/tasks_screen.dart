import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import '../widgets/task_card.dart';
import '../localization/app_language.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Map<String, dynamic>> tasks = [];

  Future<void> goToAddTask() async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddTaskScreen()),
    );

    if (newTask != null && newTask.toString().isNotEmpty) {
      setState(() {
        tasks.add({
          AppLanguage.get("title"): newTask,
          AppLanguage.get("done"): false,
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b0c0c),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: goToAddTask,
        child: const Icon(Icons.add),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              /// TITLE
              Center(
                child: Text(
                  AppLanguage.get("tasks"),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// SEARCH BAR
              TextField(
                decoration: InputDecoration(
                  hintText: AppLanguage.get("search_tasks"),
                  hintStyle: const TextStyle(
                    color: Colors.white54,
                  ),
                  filled: true,
                  fillColor: Colors.black26,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 20),

              /// TASK LIST
              Expanded(
                child: tasks.isEmpty
                    ? Center(
                        child: Text(
                          AppLanguage.get("no_tasks"),
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return TaskCard(
                            title:
                                tasks[index][AppLanguage.get(
                                  "title",
                                )],
                            isDone:
                                tasks[index][AppLanguage.get(
                                  "done",
                                )],

                            onToggle: () {
                              setState(() {
                                tasks[index][AppLanguage.get(
                                      "done",
                                    )] =
                                    !tasks[index][AppLanguage.get(
                                      "done",
                                    )];
                              });
                            },

                            onDelete: () {
                              setState(() {
                                tasks.removeAt(index);
                              });
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
