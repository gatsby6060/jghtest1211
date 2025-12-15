import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> list = [
    Positioned(
        left: 10, top: 10,
        child: Container(width: 50, height: 50, color: Colors.blue[200],)
    ),
    Positioned(
        left: 20, top: 20,
        child: Container(width: 50, height: 50, color: Colors.blue[200],)
    ),
    Positioned(
        left: 30, top: 30,
        child: Container(width: 50, height: 50, color: Colors.blue[200],)
    ),
    Positioned(
        left: 40, top: 40,
        child: Container(width: 50, height: 50, color: Colors.blue[200],)
    )
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body : Stack(
            children: list,
          )
      ),
    );
  }
}