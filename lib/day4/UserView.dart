import 'package:flutter/material.dart';
import 'db.dart';

class UserView extends StatefulWidget {
  final int? userId;
  UserView({super.key, this.userId});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();



  Future<void> _selectUser() async{
    var user = await DB.getUser(widget.userId!);
    print(user[0]); // user.first
    print(user.first);
    var info = user.first;
    setState(() {

      nameCtrl.text = info["name"];
      ageCtrl.text = info["age"].toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title : Text("사용자 정보"),
        ),
        body : Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(
                    labelText: "userId"
                ),
              ),
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(
                    labelText: "Name"
                ),
              ),
              TextField(
                controller: ageCtrl,
                decoration: InputDecoration(
                    labelText: "Age"
                ),
              ),
              SizedBox(height: 20,),
              // ElevatedButton(
              //     onPressed: () async {
              //       DB.updateUser(widget.userId!, nameCtrl.text, int.tryParse(ageCtrl.text)!);
              //       Navigator.pop(context, true);
              //     },
              //     child: Text("수정")
              // )
            ],
          ),
        )

    );
  }
}