import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';


void main() => runApp(Test());

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late ConfettiController ctrl;

  @override
  void initState() {
    super.initState();
    ctrl = ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ctrl.play();
                },
                child: const Text("클릭!"),
              ),
              const SizedBox(height: 20),
              ConfettiWidget(
                confettiController: ctrl,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple,
                ],
                numberOfParticles: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
