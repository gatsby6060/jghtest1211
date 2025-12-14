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

  // ============================================
  // [1단계] 변수 선언 - 화면에서 사용할 데이터들
  // ============================================
  // [변수명 규칙]
  // - _로 시작: private (이 클래스 안에서만 사용) - 예: _testtxtCtrl, _addTodo()
  // - 소문자로 시작: public (다른 곳에서도 접근 가능) - 예: textList, listChanged()
  // 보통 클래스 내부에서만 쓰는 변수/함수는 _를 붙여서 private로 만듭니다!
  
  TextEditingController _testtxtCtrl = TextEditingController();  // _로 시작 = private (이 클래스 안에서만 사용)
  List<String> textList = [];  // 소문자로 시작 = public (다른 곳에서도 접근 가능, 하지만 여기서는 클래스 내부에서만 사용)

  // ============================================
  // [2단계] 함수 정의 - 버튼을 눌렀을 때 실행할 동작들
  // build 함수 위에 정의하면, build 함수 안에서 이 함수들을 호출할 수 있어요!
  // ============================================
  
  // 할일 추가 함수 - "추가!" 버튼을 누르면 이 함수가 실행됨
  // _로 시작 = private 함수 (이 클래스 안에서만 사용)
  void _addTodo() {
    var inputtext = _testtxtCtrl.text;  // 입력 필드에서 텍스트 가져오기
    setState(() {  // 화면을 다시 그리기 위해 setState 사용
      textList.add(inputtext);  // 리스트에 추가
    });

    _testtxtCtrl.clear();  // 입력 필드 비우기
  }

  // 할일 삭제 함수 - 삭제 버튼을 누르면 이 함수가 실행됨
  // _로 시작 = private 함수 (이 클래스 안에서만 사용)
  void _deleteTodo(int index) {
    setState(() {  // 화면을 다시 그리기 위해 setState 사용
      textList.remove(textList[index]);  // 리스트에서 해당 항목 제거
    });
  }

  // ============================================
  // [3단계] build 함수 - 화면을 그리는 함수
  // Flutter는 위젯을 계속 감싸는 방식으로 화면을 만듭니다!
  // 바깥쪽 위젯이 안쪽 위젯을 감싸는 구조.
  // ============================================
  @override
  Widget build(BuildContext context) {
    return MaterialApp(  // 가장 바깥쪽: 앱 전체를 감싸는 위젯
      home : Scaffold(  // 화면의 기본 구조(바디, 앱바 등)를 제공
        body: Center(  // 내용을 화면 중앙에 배치
          child: Padding(  // 여백을 주기 위해 감싸기
            padding: const EdgeInsets.all(30),

            child: Column(  // 세로로 위젯들을 나열 화면은 모두 이안에 있음!
              mainAxisAlignment: MainAxisAlignment.center,
              children: [  // Column 안에 들어갈 위젯들의 리스트
                // [1] 제목 텍스트
                Text(
                  "할일",
                  style: TextStyle(
                    fontSize: 33,
                  ),
                ),
                
                SizedBox(height: 30,),  // 간격 주기
                
                // [2] 입력 필드와 추가 버튼을 가로로 배치
                Row(  // 가로로 위젯들을 나열
                  children: [
                    Expanded(  // TextField가 남은 공간을 모두 차지하도록
                      child: TextField(
                        controller:  _testtxtCtrl,  // 위에서 선언한 컨트롤러 연결
                        decoration: InputDecoration(
                          labelText : "할일 입력하기",
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                      ),
                    ),
                    ElevatedButton(  // "추가!" 버튼
                        onPressed: (){  // 버튼을 누르면 실행되는 함수
                          _addTodo();  // 위에서 정의한 함수 호출!
                        },
                        child: Text("추가!")
                    )
                  ],
                ),

                SizedBox(height: 30,),  // 간격 주기
                
                // [3] 할일 목록을 보여주는 리스트
                Expanded(  // 남은 공간을 모두 차지하도록
                  child: ListView.builder(  // 리스트를 동적으로 생성
                    itemCount: textList.length,  // 리스트 항목 개수
                    itemBuilder: (context, index){  // 각 항목을 어떻게 그릴지 정의
                      return ListTile(  // 리스트의 한 줄
                        title : Text(textList[index]),  // 할일 내용 표시
                        trailing: IconButton(  // 오른쪽에 삭제 버튼
                            icon: Icon(Icons.delete),
                            onPressed: () {  // 삭제 버튼을 누르면 실행
                              _deleteTodo(index);  // 위에서 정의한 함수 호출!
                            },
                        )
                      );
                    },
                  ),
                ),
              ],  // Column의 children 끝
            ),  // Padding 끝
          ),  // Center 끝
        ),  // Scaffold의 body 끝
      )  // Scaffold 끝
    );  // MaterialApp 끝
    // 위젯을 감싸는 순서: MaterialApp > Scaffold > Center > Padding > Column > ...
  }
}
