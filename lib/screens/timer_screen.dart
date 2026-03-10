import 'package:flutter/material.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                timerTab("Pomodoro", true),
                timerTab("Short Break", false),
                timerTab("Long Break", false),
              ],
            ),

            const SizedBox(height: 40),

            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 4),
              ),

              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "25:00",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text("FOCUS TIME"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),

                const SizedBox(width: 20),

                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {},
                  child: const Icon(Icons.play_arrow),
                ),

                const SizedBox(width: 20),

                IconButton(icon: const Icon(Icons.pause), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget timerTab(String text, bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),

      decoration: BoxDecoration(
        color: active ? Colors.red : Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
      ),

      child: Text(text),
    );
  }
}
