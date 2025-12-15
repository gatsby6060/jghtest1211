import 'package:flutter/material.dart';

// 최초에는 출력 x
// 버튼 클릭 했을 때
// 50 *50 크기의 박스를 색은 자유롭게
// 10개를 랜덤한 위치에 출력
// (0~500, 0~600)

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
        left:10, top: 10,
        child: Container(width: 50, height: 50, color: Colors.blue,)),
    Positioned(
        left:20, top: 20,
        child: Container(width: 50, height: 50, color: Colors.blue,)),
    Positioned(
        left:30, top: 30,
        child: Container(width: 50, height: 50, color: Colors.blue,)),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Stack(
              children: list,
            )
        )
    );
  }
}
