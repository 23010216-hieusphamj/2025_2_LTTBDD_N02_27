import 'package:flutter/material.dart';
import '../localization/app_language.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b0c0c),

      appBar: AppBar(
        title: Text(
          AppLanguage.get("group_info"),
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff2b0c0c),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          /// COURSE
          Text(
            AppLanguage.get("course"),
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xff3a1111),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLanguage.get("mobile_device_programming"),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  AppLanguage.get("group_27"),
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          /// STUDENT
          Text(
            AppLanguage.get("student"),
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xff3a1111),
              borderRadius: BorderRadius.circular(12),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLanguage.get("full_name"),
                  style: TextStyle(color: Colors.white54),
                ),

                SizedBox(height: 4),

                Text(
                  "Phạm Bá Hiếu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 15),

                Text(
                  AppLanguage.get("student_id"),
                  style: TextStyle(color: Colors.white54),
                ),

                SizedBox(height: 4),

                Text(
                  "23010216",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          /// INSTRUCTOR
          Text(
            AppLanguage.get("instructor"),
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xff3a1111),
              borderRadius: BorderRadius.circular(12),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLanguage.get("instructor_1"),
                  style: TextStyle(color: Colors.white70),
                ),

                SizedBox(height: 4),

                Text(
                  "Nguyễn Xuân Quế",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
