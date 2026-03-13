import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b0c0c),

      appBar: AppBar(
        backgroundColor: const Color(0xff2b0c0c),
        elevation: 0,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            /// GENERAL
            const Text(
              "GENERAL",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                color: const Color(0xff3a1111),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  /// NOTIFICATION
                  SwitchListTile(
                    title: const Text(
                      "Notifications",
                      style: TextStyle(color: Colors.white),
                    ),
                    secondary: const Icon(
                      Icons.notifications,
                      color: Colors.red,
                    ),
                    value: notifications,
                    onChanged: (value) {
                      setState(() {
                        notifications = value;
                      });
                    },
                  ),

                  const Divider(color: Colors.white10),

                  /// THEME
                  ListTile(
                    leading: const Icon(
                      Icons.dark_mode,
                      color: Colors.red,
                    ),
                    title: const Text(
                      "Theme",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      "Dark Mode",
                      style: TextStyle(color: Colors.white54),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white54,
                      size: 16,
                    ),
                  ),

                  const Divider(color: Colors.white10),

                  /// LANGUAGE
                  ListTile(
                    leading: const Icon(
                      Icons.language,
                      color: Colors.red,
                    ),
                    title: const Text(
                      "Language",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      "English",
                      style: TextStyle(color: Colors.white54),
                    ),
                    trailing: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// APP
            const Text(
              "APP",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                color: const Color(0xff3a1111),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  /// ABOUT
                  const ListTile(
                    leading: Icon(Icons.info, color: Colors.red),
                    title: Text(
                      "About",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Version 1.0.0",
                      style: TextStyle(color: Colors.white54),
                    ),
                  ),

                  const Divider(color: Colors.white10),

                  /// PRIVACY
                  const ListTile(
                    leading: Icon(
                      Icons.privacy_tip,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Privacy Policy",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.open_in_new,
                      color: Colors.white54,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
