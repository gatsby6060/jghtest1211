import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : MyIndicator()
    );
  }
}

class MyIndicator extends StatefulWidget {
  const MyIndicator({super.key});

  @override
  State<MyIndicator> createState() => _MyIndicatorState();
}

class _MyIndicatorState extends State<MyIndicator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                radius: 100,
                lineWidth: 10,
                percent: 0.71,
                center: Text("71%"),
                progressColor: Colors.green,
                backgroundColor: Colors.yellow,
                animation: true,
                animationDuration: 1200,
              ),
              SizedBox(height: 50,),

              LinearPercentIndicator(

                lineHeight: 30.0,
                percent: 0.8,
                center: Text("80%"),
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
                animation: true,
                animationDuration: 1200,
                barRadius: Radius.circular(10.0),
              )
            ],
          ),
        )
    );
  }
}

