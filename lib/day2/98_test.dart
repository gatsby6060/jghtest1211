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
  var _txt = "Flutter";
  var _color = Colors.purple[200];
  var _align = Alignment.center;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Align(
          alignment: _align,
          child: ElevatedButton(
              onPressed: (){
                setState(() {
                  if(_txt == "Flutter"){
                    _txt = "재밌다";
                    _color = Colors.green[100];
                    _align = Alignment.topCenter;
                  } else {
                    _txt = "Flutter";
                    _color = Colors.purple[200];
                    _align = Alignment.center;
                  }
                });
              },
              child: Text(_txt),
              style: ElevatedButton.styleFrom(
                backgroundColor: _color
          ),
          ),
        )
      )
    );
  }
}


