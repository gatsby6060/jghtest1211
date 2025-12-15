import 'package:flutter/material.dart';
import 'BPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: APage(),
    );
  }
}

class APage extends StatefulWidget {
  const APage({super.key});

  @override
  State<APage> createState() => _APageState();
}

class _APageState extends State<APage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text("A페이지"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.list),)
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BPage(msg: "A에서 넘긴 값")
                // builder: (_) => BPage()
              ),
            );
          },
          child: const Text("값을 넣어서 이동"),
        ),
      ),
    );
  }
}
