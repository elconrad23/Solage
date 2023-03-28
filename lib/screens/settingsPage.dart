import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  static const String title = "Settings";
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Settings.title),
        leading: Image(image: AssetImage("assets/solage-logo.png")),
        
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.settings,
            ),
          )
        ],
      ),
    );
  }
}
