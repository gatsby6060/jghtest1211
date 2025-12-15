// 50*50 크기의 박스를(색은 자유롭게)
//
// 랜덤한 위치에 출력
//
// (0~300, 0~300)
// 버튼 클릭할 때마다 위치 변경

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
  late Offset position =  Offset(_ran.nextDouble()*300, _ran.nextDouble()*300);

 void _moveBox(){
   setState(() {
     position =  Offset(_ran.nextDouble()*300, _ran.nextDouble()*300);
   });
 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //이거 꼭 필요!!
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    left: position.dx,
                    top: position.dy,
                    child: Container(width: 50, height: 50, color: Colors.blue),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.green[100],
              child: Center(
                child: ElevatedButton(
                  onPressed: _moveBox,
                  child: Text("버튼 위치 이동"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
