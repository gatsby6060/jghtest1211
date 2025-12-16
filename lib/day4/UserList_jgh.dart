import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'UserEdit_jgh.dart';
import 'db_jgh.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}


const String age = "age";
class _UserListState extends State<UserList> {


  List<Map<String, dynamic>> list = [
    // {"userId" : "hong", "name" : "홍길동", age : 30},
    // {"userId" : "kim", "name" : "김철수", age : 25},
    // {"userId" : "park", "name" : "박영희", age : 20}
  ];

  Future<void> _selectUserList() async{
    var userList = await DB.selectUser();
    setState(() {
      list = userList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectUserList();
  }


  void deleteUser()  {
    Fluttertoast.showToast(msg: "삭제 버튼눌렸습니다.");


    // int age = int.tryParse(txtAgeCtrl.text) ?? 0;
    // await DB.insertUser(
    //     name, age
    // );
    // txtNameCtrl.clear();
    // txtAgeCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey[50],
              title: const Text("사용자목록"),

            ),

            body : Column(  // 세로로 위젯들을 나열
                children: [
                Expanded(  // 남은 공간을 모두 차지하도록
                    child: list.isEmpty  // 리스트가 비어있는지 확인
                        ? Center(child: Text("입력 사람 없음"),)  // 비어있으면 "할 일 없음" 표시

                        : ListView.builder(  // 리스트를 동적으로 생성
                      itemCount: list.length,  // 리스트 항목 개수
                      itemBuilder: (context, index) {  // 각 항목을 어떻게 그릴지 정의

                        var user = list[index];

                        Map item = list[index];  // 현재 항목의 Map 가져오기

                        return ListTile(
                          title: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "아이디 : ${item["userId"]} , 이름 : ${item["name"]}\n",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "나이 : ${item["age"]}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min, // 중요! 안 넣으면 화면에 사용자 데이터가 안보임...
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () async {

                                  // Fluttertoast.showToast(msg: "편집");
                                  bool flg = await Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => UserEdit(userId: user["userId"]),));

                                  if(flg){
                                    _selectUserList();
                                  }

                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (_) => UserEdit(
                                  //       // name: item["name"],
                                  //       // age: item[age],
                                  //       userId : item["userId"]
                                  //     ),
                                  //   ),
                                  // );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () async{
                                  // await DB.deleteUser(user["userId"]);
                                  await DB.deleteUser(item["userId"]);
                                  // NavigationBar.of(context).pop();
                                  Navigator.pop(context);

                                  // Fluttertoast.showToast(msg: "삭제함수 직전");
                                  _selectUserList();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                ),
            ],
            ),
        );
  }
}
