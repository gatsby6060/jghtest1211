import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      '/dog.jpg', '/airplane.jpg', '/airplane2.jfif',
      '/bear.jpg', '/car.png', '/car2.png',
    ];

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Text(
              "사진 나오기",
              style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
            ),

            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: labels.length,        // labels 개수만큼 출력
                  itemBuilder: (context, index){
                    return Container(
                      color : Colors.blue[100*((index%9)+1)],
                      child: Center(
                          child: Image.asset(
                            labels[index],
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
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
