import 'package:flutter/material.dart';
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

  TextEditingController _testtxtCtrl = TextEditingController();

  List<String> textList = [];


  void _addTodo() {
    var inputtext = _testtxtCtrl.text;
    setState(() {
      textList.add(inputtext);
    });

    _testtxtCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: Scaffold(

        body: Center(

          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "할일",
                  style:
                    TextStyle(
                      fontSize: 33,
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller:  _testtxtCtrl,
                        decoration: InputDecoration(
                          labelText : "할일 입력하기",
                          // hintText : "ex) test@naver.com",
                          // prefixIcon: Icon(Icons.email),
                          // suffixIcon: Icon(Icons.check_circle, color: Colors.green),
                          // border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.grey[100],
                          // enabled: false
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (){

                          _addTodo();

                          // Fluttertoast.showToast(
                          //     // msg: _testtxtCtrl.toString(),
                          //     msg : textList.toString(),
                          //     toastLength: Toast.LENGTH_LONG,
                          //     gravity: ToastGravity.BOTTOM,
                          //     timeInSecForIosWeb: 1,
                          //     backgroundColor: Colors.grey[500],
                          //     textColor: Colors.white,
                          //     fontSize: 16.0
                          // );

                        },
                        child: Text("추가!")
                    )
                  ],
                ),

                SizedBox(height: 30,),

                Expanded(
                  child: ListView.builder(
                    itemCount: textList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(textList[index]),
                        trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              Fluttertoast.showToast(
                                msg: "버튼눌림",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.grey[500],
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            },
                        )
                      );
                    },
                  ),
                ),


              ],
            ),
          ),
        ),

      ),
    );
  }
}
