import 'package:flutter/material.dart';
import 'db_jgh.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await DB.insertData("hong", 30, 170.5);
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       content: Text("저장되었습니다."),
                    //     )
                    // );
                  },
                  child: Text("Insert Test"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    List<Map<String, dynamic>> list = [];
                    list = await DB.getData();
                    print(list);
                  },
                  child: Text("Select Test "),
                ),
                ElevatedButton(
                  onPressed: () async{
                    await DB.updateData(2,"kim",25);
                  },
                  child: Text("Update Test "),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Fluttertoast.showToast( msg: "버튼눌렸습니다.",);
                    await DB.deleteData(6);
                  },
                  child: Text("Delete Test "),
                ),
              ],
          ),
        ),
      )
    );
  }
}
