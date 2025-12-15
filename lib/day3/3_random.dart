import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Random _ran = Random();
  int ranNum = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("랜덤 숫자 값: $ranNum" ),
                  // Text(ranNum),
                ],

              ),
              ElevatedButton(
              onPressed: (){
                // _ran.nextInt(10); // 0~ 9사이 값 랜덤하게 나옴
                // _ran.nextDouble(); // 0.0~1.0 사이 값
                // _ran.nextDouble() * 9 + 1 ; // 0~10사이값
                setState(() {
                  ranNum = _ran.nextInt(10)+1;
                });
              },
              child: Text("랜덤 숫자 뽑기")
            ),

            ]
          ),
        ),
      )
    );
  }
}
