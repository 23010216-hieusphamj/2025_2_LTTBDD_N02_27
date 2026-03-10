import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b0c0c),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: const [
              Text("Group Info", style: TextStyle(fontSize: 22)),

              SizedBox(height: 20),

              Text("Course: Mobile Device Programming"),

              SizedBox(height: 10),

              Text("Student: Phạm Bá Hiếu"),

              SizedBox(height: 10),

              Text("Student ID: 23010216"),

              SizedBox(height: 10),

              Text("Instructor: Nguyễn Xuân Quế"),
            ],
          ),
        ),
      ),
    );
  }
}
