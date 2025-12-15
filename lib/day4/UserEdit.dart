import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// void main() {
//   runApp(const UserEdit());
// }

class UserEdit extends StatefulWidget {
//   final String? msg;
  final String? name;
  final int? age;
  const UserEdit({super.key, this.name, this.age });

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {

  TextEditingController txtNameCtrl = TextEditingController();  // 텍스트 입력 필드 제어용
  TextEditingController txtAgeCtrl = TextEditingController();

  void addToUser(){
    Fluttertoast.showToast(
      msg: "버튼눌렸습니다.",
    );

    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    print("넘겨받은 name: ${widget.name}");
    print("넘겨받은 age: ${widget.age}");
    return
    // MaterialApp(
    //   home:
      Scaffold(

          appBar: AppBar(
            backgroundColor: Colors.grey[50],
            title: const Text("사용자 수정"),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.list),)
            ],
          ),

          body : Column(  // 세로로 위젯들을 나열



            // children은 여러 위젯을 담는 리스트
            children: [

              //얼라인... 속성값 네임 에이지 텍스ㅅ트 필드 힌트
              // Text("Name"),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: txtNameCtrl,
                  decoration: const InputDecoration(
                      labelText : "이름"
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Text("Age"),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: txtAgeCtrl,
                  decoration: const InputDecoration(
                      labelText : "나이"
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),

              const SizedBox(height: 12),

              ElevatedButton(
                  onPressed: addToUser,
                  child: Text("수정")
              )

            ]
          )
      );
    // );
  }
}
