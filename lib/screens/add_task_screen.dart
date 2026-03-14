import 'package:flutter/material.dart';
import '../localization/app_language.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController controller =
      TextEditingController();

  void saveTask() {
    if (controller.text.trim().isEmpty) return;

    Navigator.pop(context, controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b0c0c),

      appBar: AppBar(
        title: Text(
          AppLanguage.get("add_task"),
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff2b0c0c),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLanguage.get("task_name"),
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),

              decoration: InputDecoration(
                hintText: AppLanguage.get("enter_task"),
                hintStyle: const TextStyle(
                  color: Colors.white54,
                ),
                filled: true,
                fillColor: Colors.black26,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: saveTask,

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                ),

                child: Text(
                  AppLanguage.get("save_task"),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
