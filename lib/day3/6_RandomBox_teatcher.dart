import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

// 랜덤한 10개 박스 지우기
// 숫자는 무조건 순서대로
// 클릭 시 박스 지우기
// 1->2->3
// 1이 있는데 2누르면 지우기 x
//
// 다 지우면 새롭게 10개 박스 생성

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

  ];


  void _createBox(){
    // Fluttertoast.showToast(
    //     msg: "눌리긴 한듯1...",
    // );
    List<Widget> tempList = [];
    // int j = 1;

    for(int i=1; i<=10; i++){
      tempList.add(
          Positioned(
              left: _ran.nextDouble()* (MediaQuery.of(context).size.width - 50) ,
              top: _ran.nextDouble()* (MediaQuery.of(context).size.height - 100) ,
              child: GestureDetector(
                onTap:()=>_removeBoxTeacher(i-1),
                child: Container(
                  child: Center(
                    child: Text("$i"),
                  ),
                  width: 50, height: 50, color: Colors.blue[200],
                ),
              )
          )
      );
    }
    setState(() {
      list = tempList;
      // print(list);
    });
  }

  // void _removeBox(){
  //   Fluttertoast.showToast(msg: "눌리긴 한듯");
  //   setState(() {
  //     list.remove(list[0]);
  //   });
  // }
  int currentIdx = 0;
  void _removeBoxTeacher(int index){
    if(index == currentIdx){
      currentIdx++;
      Fluttertoast.showToast(msg: "눌리긴 한듯");
      setState(() {
        list.removeAt(0);
      });
      if(list.length == 0){
        currentIdx = 0;
        _createBox();
      }
    }

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
