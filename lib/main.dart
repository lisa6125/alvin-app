import 'package:flutter/material.dart';
import 'resume_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Resume',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ResumePage(),
    );
  }
}