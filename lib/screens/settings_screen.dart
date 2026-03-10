import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b0c0c),

      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),

            const Center(
              child: Text("Settings", style: TextStyle(fontSize: 22)),
            ),

            const SizedBox(height: 20),

            SwitchListTile(
              title: const Text("Notifications"),
              value: true,
              onChanged: (v) {},
            ),

            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text("Theme"),
              subtitle: const Text("Switch to Light Mode"),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.language),
              title: const Text("Language"),
              subtitle: const Text("English"),
            ),
          ],
        ),
      ),
    );
  }
}
