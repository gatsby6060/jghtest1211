import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'db_jgh.dart';

// void main() {
//   runApp(const UserEdit());
// }

class UserEdit extends StatefulWidget {
//   final String? msg;
  final int? userId;
  // final String? name;
  // final int? age;
  // const UserEdit({super.key, this.name, this.age });
  const UserEdit({super.key, this.userId });


  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {

  TextEditingController txtNameCtrl = TextEditingController();  // 텍스트 입력 필드 제어용
  TextEditingController txtAgeCtrl = TextEditingController();

  Map<String, dynamic>? info; //일단 담을 맵 자체적으로 만들어봄... 모르겟다....

  Future<void> _selectUser() async {

    var user = await DB.getUser(widget.userId!); //  !사용

    // Fluttertoast.showToast(msg: info);
    // print(user);
    // print(user[0]);
    print(user.first);
    var info = user.first;
    setState(() {
      txtNameCtrl.text = info["name"];
      txtAgeCtrl.text = info["age"].toString();
    });

  }

  // initState: 화면이 처음 생성될 때 한 번만 실행되는 함수
  // day3의 BPage처럼 widget.name, widget.age로 전달받은 값을 TextField에 넣어줍니다!
  @override
  void initState() {
    super.initState();
    // // 전달받은 name 값을 TextField에 표시
    // if (widget.name != null) {
    //   txtNameCtrl.text = widget.name!;
    // }
    // // 전달받은 age 값을 TextField에 표시 (int를 String으로 변환)
    // if (widget.age != null) {
    //   txtAgeCtrl.text = widget.age.toString();
    // }
    _selectUser();

  }



  void editToUser() async {
    Fluttertoast.showToast(
      msg: "버튼눌렸습니다.",
    );

    DB.updateData(
        widget.userId!,  txtNameCtrl.text,  int.tryParse(txtAgeCtrl.text)!
    ); // ! null이 아니다 분명히 정의

    Navigator.pop(context, true); // 이전페이지로 이동
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    // print("넘겨받은 name: ${widget.name}");
    // print("넘겨받은 age: ${widget.age}");
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
                  onPressed: editToUser,
                  child: Text("수정")
              )

            ]
          )
      );
    // );
  }
}
