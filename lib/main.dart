import 'package:flutter/material.dart';
import 'package:poetry_app/view/screens/home.dart';
import 'package:poetry_app/view/screens/poet_screen.dart';
import 'package:poetry_app/view/screens/read_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poetry App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ReadScreen(),
    );
  }
}
