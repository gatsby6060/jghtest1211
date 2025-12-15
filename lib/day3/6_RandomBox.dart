import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';


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
  final Random _ran = Random();
  late List<Widget> list = [
    // 일단 비우자....
    // Positioned(
    //     left: position.dx,
    //     top: position.dy,
    //     child: Container(width: 50, height: 50, color: Colors.blue,)),
    // Positioned(
    //     left: position.dx,
    //     top: position.dy,
    //     child: Container(width: 50, height: 50, color: Colors.blue,)),
    // Positioned(
    //     left: position.dx,
    //     top: position.dy,
    //     child: Container(width: 50, height: 50, color: Colors.blue,)),
  ];

  // late Offset position =  Offset(_ran.nextDouble()*300, _ran.nextDouble()*300);


  void _createBox(){
    // Fluttertoast.showToast(
    //     msg: "눌리긴 한듯1...",
    // );
    List<Widget> tempList = [];
    for(int i=1; i<=10; i++){
      tempList.add(
          Positioned(
              left: _ran.nextDouble()* (MediaQuery.of(context).size.width - 50) ,
              top: _ran.nextDouble()* (MediaQuery.of(context).size.height - 100) ,
              child: Container(
                child: Center(
                  child: Text("$i"),
                ),
                width: 50, height: 50, color: Colors.blue[200],
              )
          )
      );
    }
  setState(() {
    list = tempList;
    // print(list);
  });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
              children: [

                Expanded(
                  child: Stack(
                    children: list,
                  ),
                ),

                Container(
                  height: 50, color: Colors.green[100],
                    child: ElevatedButton(
                      onPressed: _createBox,
                      child: Text("박스 생성"),
                    ),
                  ),
              ],


            )
        )
    );
  }
}
