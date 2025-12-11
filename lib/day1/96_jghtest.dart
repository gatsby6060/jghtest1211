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
  List<String> labels = [
    'C', '(', '%', '/',
    '7', '8', '9', '*',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '00', '.', '='
  ];
  @override
  Widget build(BuildContext context) {

    //   List<String> labels = [
  //     'C', '(', '%', '/',
  //     '7', '8', '9', '*',
  //     '4', '5', '6', '-',
  //     '1', '2', '3', '+',
  //     '0', '00', '.', '='
  //   ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title : Text("계산기")),
        body: Column(
          children: [
            // const Text(
            //   "계산기",
            //   style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
            // ),

            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: labels.length,        // labels 개수만큼 출력
                  itemBuilder: (context, index){
                    return ElevatedButton( //이건 기본이 동그라미 버튼임
                      onPressed: (){
                        print("${labels[index]} 버튼 클릭됨!");
                        //여기 나중에 뭐라도 넣으면 되나?
                      },
                      child: Text(labels[index], style:TextStyle(color : Colors.black, fontSize: 30)),

                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
