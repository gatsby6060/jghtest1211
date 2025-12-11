import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      'C', '(', '%', '/',
      '7', '8', '9', '*',
      '4', '5', '6', '-',
      '1', '2', '3', '+',
      '0', '00', '.', '='
    ];
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Text(
              "계산기",
              style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
            ),

            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: labels.length,        // labels 개수만큼 출력
                  itemBuilder: (context, index){
                    return Container(
                      color : Colors.blue[100*((index%9)+1)],
                      child: Center(
                          child: Text(
                              labels[index],
                               style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                          )
                      ),
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
