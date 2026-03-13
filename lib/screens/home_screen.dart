import 'package:flutter/material.dart';
import 'timer_screen.dart';
import 'tasks_screen.dart';
import 'info_screen.dart';
import 'settings_screen.dart';
import '../localization/app_language.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final screens = [
    const TimerScreen(),
    const TasksScreen(),
    const InfoScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff1a1a1a),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,

        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: AppLanguage.get("timer"),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: AppLanguage.get("tasks"),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: AppLanguage.get("info"),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: AppLanguage.get("settings"),
          ),
        ],
      ),
    );
  }
}
