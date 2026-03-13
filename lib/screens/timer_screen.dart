import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import '../localization/app_language.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b0c0c),

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
              AppLanguage.get("pomodoro_timer"),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: AppLanguage.get("pomodoro")),
                Tab(text: AppLanguage.get("break")),
              ],
            ),

            const SizedBox(height: 30),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  TimerUI(
                    seconds: 1500,
                    label: AppLanguage.get("focus_time"),
                    isFocus: true,
                    tabController: _tabController,
                  ),
                  TimerUI(
                    seconds: 300,
                    label: AppLanguage.get("break_time"),
                    isFocus: false,
                    tabController: _tabController,
                  ),
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
  final bool isFocus;
  final TabController tabController;
  const TimerUI({
    super.key,
    required this.seconds,
    required this.label,
    required this.isFocus,
    required this.tabController,
  });

  @override
  State<TimerUI> createState() => _TimerUIState();
}

class _TimerUIState extends State<TimerUI> {
  late int remainingSeconds;
  late int totalSeconds;

  Timer? timer;
  bool isRunning = false;

  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.seconds;
    totalSeconds = widget.seconds;
  }

  void playAlarm() async {
    await player.play(AssetSource('sounds/nhac_chuong.mp3'));
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
        playAlarm(); // 🔔 phát âm thanh khi hết giờ
        showFinishDialog(); // 🔔 hiển thị dialog khi phiên làm việc kết thúc
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
      remainingSeconds = totalSeconds;
      isRunning = false;
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;

    return "${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }

  void stopAlarm() async {
    await player.stop();
  }

  void showTimeInputDialog() {
    TextEditingController minController =
        TextEditingController();
    TextEditingController secController =
        TextEditingController();

    minController.text = (remainingSeconds ~/ 60).toString();
    secController.text = (remainingSeconds % 60).toString();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLanguage.get("set_timer")),

          content: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: minController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: AppLanguage.get("minutes"),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: TextField(
                  controller: secController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: AppLanguage.get("seconds"),
                  ),
                ),
              ),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(AppLanguage.get("cancel")),
            ),

            TextButton(
              onPressed: () {
                int minutes =
                    int.tryParse(minController.text) ?? 0;
                int seconds =
                    int.tryParse(secController.text) ?? 0;

                int total = minutes * 60 + seconds;

                if (total > 0) {
                  setState(() {
                    totalSeconds = total;
                    remainingSeconds = total;
                  });
                }

                Navigator.pop(context);
              },
              child: Text(AppLanguage.get("save")),
            ),
          ],
        );
      },
    );
  }

  void showFinishDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLanguage.get("session_finished")),

          content: Text(
            widget.isFocus
                ? AppLanguage.get("pomodoro_finished")
                : AppLanguage.get("break_finished"),
          ),

          actions: [
            // STOP ALARM
            TextButton(
              onPressed: () {
                player.stop();

                setState(() {
                  remainingSeconds = totalSeconds;
                });

                Navigator.pop(context);
              },
              child: Text(AppLanguage.get("stop_alarm")),
            ),

            // START NEXT SESSION
            ElevatedButton(
              onPressed: () {
                player.stop();

                Navigator.pop(context);

                if (widget.isFocus) {
                  // chuyển sang tab Break
                  widget.tabController.animateTo(1);
                } else {
                  // chuyển sang tab Pomodoro
                  widget.tabController.animateTo(0);
                }
              },

              child: Text(
                widget.isFocus
                    ? AppLanguage.get("start_break")
                    : AppLanguage.get("start_focus"),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double progress = remainingSeconds / totalSeconds;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 230,
          height: 230,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 230,
                height: 230,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 8,
                  backgroundColor: Colors.grey.shade800,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(
                        Colors.blue,
                      ),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: showTimeInputDialog,
                    child: Text(
                      formatTime(remainingSeconds),
                      style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.label,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 40),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
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
