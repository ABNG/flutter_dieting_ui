import 'package:flutter/material.dart';
import 'package:flutterdietingui/screens/screen_1.dart';
import 'package:flutterdietingui/screens/screen_2.dart';
import 'package:flutterdietingui/screens/workout_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Screen1.name,
      routes: {
        Screen1.name: (context) => Screen1(),
        Screen2.name: (context) => Screen2(),
        WorkoutScreen.name: (context) => WorkoutScreen(),
      },
    );
  }
}
