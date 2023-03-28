import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

Future<String> getLevel() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("battery_levels");
// Get the data once
  DatabaseEvent event = await ref.once();
// Print the data of the snapshot
  String currentLevel = (event.snapshot.value.toString());
  return currentLevel;
}

Future<String> getTime() async {
  DatabaseReference ref1 = FirebaseDatabase.instance.ref("Times");
// Get the data once
  DatabaseEvent event1 = await ref1.once();
// Print the data of the snapshot
  String timeLeft = (event1.snapshot.value.toString());
  return timeLeft;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String title = "The Power Management app";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    String currentLevel = getLevel() as String;
    String timeLeft = getTime() as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(HomeScreen.title),
        leading: Image(image: AssetImage("assets/solage-logo.png")),
      ),
      body: Column(
        children: [
          ListTile(
              leading: Icon(Icons.power),
              title: Text('Power level left:'),
              trailing: Text(currentLevel)),
          ListTile(
              leading: Icon(Icons.power),
              title: Text('Time left:'),
              trailing: Text(timeLeft)),
        ],
      ),
    );
  }
}
