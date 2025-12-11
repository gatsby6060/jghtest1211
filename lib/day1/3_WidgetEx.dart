import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("zz"),
              Icon(Icons.home),
              ElevatedButton(onPressed: (){}, child: Text("버튼!")),
              IconButton(onPressed: (){}, icon: Icon(Icons.home)),
              Container(width: 50, height: 50, color: Colors.blue),
              // Container <-> SizedBox 거의 유사
              Image.asset("/dog.jpg", width: 70, height: 70,),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("cat.jpg"),
              )
            ],
          ),
        )
    );
  }
}
