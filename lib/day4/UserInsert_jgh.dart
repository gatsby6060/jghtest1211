import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'UserList_jgh.dart';
import 'db_jgh.dart';

void main() {
  runApp(const MyApp());
}

// ✅ MaterialApp은 최상단에 딱 1번
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserInsert(),
    );
  }
}

class UserInsert extends StatefulWidget {
  const UserInsert({super.key});

  @override
  State<UserInsert> createState() => _UserInsertState();
}

class _UserInsertState extends State<UserInsert> {
  final TextEditingController txtNameCtrl = TextEditingController();
  final TextEditingController txtAgeCtrl = TextEditingController();


   void  addToUser() async {
    Fluttertoast.showToast(msg: "버튼눌렸습니다.");
    // setState(() {});
    String name = txtNameCtrl.text;
    int age = int.tryParse(txtAgeCtrl.text) ?? 0;
    await DB.insertUser(
        name, age
    );
    txtNameCtrl.clear();
    txtAgeCtrl.clear();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: const Text("sqlite 실습"),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const UserList()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txtNameCtrl,
              decoration: const InputDecoration(labelText: "Name"),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txtAgeCtrl,
              decoration: const InputDecoration(labelText: "Age"),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: addToUser,
            child: const Text("사용자 추가"),
          ),
        ],
      ),
    );
  }
}
