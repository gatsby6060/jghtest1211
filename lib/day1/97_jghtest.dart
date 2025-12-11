import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body : Row(
              children: [
                Flexible(child: Container( color : Colors.yellow), flex: 1,),
                Flexible(
                    child:Column(
                      children: [
                        Flexible(child: Container( color : Colors.purple), flex: 1,),
                        Flexible(child: Container( color : Colors.grey), flex: 1,),
                        Flexible(child: Container( color : Colors.blue), flex: 1,),
                      ],
                    ), flex: 2
                ),
                Flexible(child: Container( color : Colors.purple), flex: 1)
              ]
          )
      ),
    );
  }
}
