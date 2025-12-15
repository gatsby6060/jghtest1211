import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {

  // new CircularPercentIndicator(
  // radius: 60.0,
  // lineWidth: 5.0,
  // percent: 1.0,
  // center: new Text("100%"),
  // progressColor: Colors.green,
  // )

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Circular Percent Indicators"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                radius: 100.0,
                lineWidth: 10.0,
                percent: 0.8,
                header: new Text("Icon header"),
                center: new Icon(
                  Icons.person_pin,
                  size: 50.0,
                  color: Colors.blue,
                ),
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,

                animation: true,
                animationDuration: 2900,
              ),
              // SizedBox(50),
              LinearPercentIndicator(
              width: 170.0,
              animation: true,
              animationDuration: 1000,
              lineHeight: 20.0,
              leading: new Text("left content"),
              trailing: new Text("right content"),
              percent: 0.5,
              center: Text("50.0%"),
              linearStrokeCap: LinearStrokeCap.butt,
              progressColor: Colors.red,
            )
          ],


            
          ),
        ),
      ),
    );
  }
}
