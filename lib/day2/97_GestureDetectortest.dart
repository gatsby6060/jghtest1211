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
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : GestureDetector(
              onTap: (){
                setState(() {
                  isDark = !isDark;
                });
              },
              child: Container(
                color : isDark ? Colors.black : Colors.white,
                child: Center(
                  child: Text(
                      "클릭",
                      style: TextStyle(color: isDark ? Colors.white : Colors.black),
                  ),

                ),
              ),
            ),


    );
  }
}
