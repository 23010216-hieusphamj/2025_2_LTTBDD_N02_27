import 'package:flutter/material.dart';
import 'dart:async';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b0c0c),

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              "Pomodoro Timer",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            TabBar(
              controller: _tabController,

              indicator: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),

              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,

              tabs: const [
                Tab(text: "Pomodoro"),
                Tab(text: "Short Break"),
                Tab(text: "Long Break"),
              ],
            ),

            const SizedBox(height: 30),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  TimerUI(seconds: 1500, label: "FOCUS TIME"),
                  TimerUI(seconds: 300, label: "SHORT BREAK"),
                  TimerUI(seconds: 900, label: "LONG BREAK"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerUI extends StatefulWidget {
  final int seconds;
  final String label;

  const TimerUI({super.key, required this.seconds, required this.label});

  @override
  State<TimerUI> createState() => _TimerUIState();
}

class _TimerUIState extends State<TimerUI> {
  late int remainingSeconds;
  Timer? timer;
  bool isRunning = false;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.seconds;
  }

  void startTimer() {
    if (isRunning) return;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });

    setState(() {
      isRunning = true;
    });
  }

  void pauseTimer() {
    timer?.cancel();

    setState(() {
      isRunning = false;
    });
  }

  void resetTimer() {
    timer?.cancel();

    setState(() {
      remainingSeconds = widget.seconds;
      isRunning = false;
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;

    String m = minutes.toString().padLeft(2, '0');
    String s = secs.toString().padLeft(2, '0');

    return "$m:$s";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 220,
          height: 220,

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue, width: 4),
          ),

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formatTime(remainingSeconds),
                  style: const TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 10),

                Text(widget.label, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),

        const SizedBox(height: 40),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.refresh, color: Colors.white),
              onPressed: resetTimer,
            ),

            const SizedBox(width: 20),

            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: startTimer,
              child: const Icon(Icons.play_arrow),
            ),

            const SizedBox(width: 20),

            IconButton(
              icon: const Icon(Icons.pause, color: Colors.white),
              onPressed: pauseTimer,
            ),
          ],
        ),
      ],
    );
  }
}
