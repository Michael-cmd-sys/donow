import 'package:flutter/material.dart';
import "package:hive/hive.dart";
import 'package:donow/screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  
  var box = await Hive.openBox("tasks");
  
  runApp(const DoNow());
}

class DoNow extends StatelessWidget {
  const DoNow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.yellow,
        primaryColor: Colors.yellow,
      ),
      home: HomeScreen(),
    );
  }
}
