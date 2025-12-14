import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ============================================
// [main 함수] - 앱의 시작점
// ============================================
void main() => runApp(ToDoList());

// ============================================
// [ToDoList 클래스] - 앱 전체를 감싸는 StatelessWidget
// MaterialApp을 반환하는 역할만 합니다
// ============================================
class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : ToDoManager()  // 실제 할일 관리 화면을 보여줌
    );
  }
}

// ============================================
// [ToDoManager 클래스] - 할일을 관리하는 StatefulWidget
// StatefulWidget이므로 상태(할일 목록)를 관리할 수 있습니다
// ============================================
class ToDoManager extends StatefulWidget {
  const ToDoManager({super.key});

  @override
  State<ToDoManager> createState() => _ToDoManagerState();
}

// ============================================
// [_ToDoManagerState 클래스] - 실제 할일 관리 로직이 들어있는 State 클래스
// ============================================
class _ToDoManagerState extends State<ToDoManager> {
  
  // ============================================
  // [1단계] 변수 선언 - 화면에서 사용할 데이터들
  // ============================================
  // [변수명 규칙]
  // - _로 시작: private (이 클래스 안에서만 사용) - 예: _testtxtCtrl, _addTodo()
  // - 소문자로 시작: public (다른 곳에서도 접근 가능) - 예: textList, listChanged()
  // 보통 클래스 내부에서만 쓰는 변수/함수는 _를 붙여서 private로 만듭니다!
  //
  // [child vs children 차이]
  // - child: 하나의 위젯만 담을 때 사용 (예: Padding의 child, Expanded의 child)
  // - children: 여러 위젯을 담을 때 사용 (예: Column의 children, Row의 children)
  // ⭐ children은 리스트뿐 아니라 화면 배치(Column, Row)할 때도 많이 써요!
  
  TextEditingController txtCtrl = TextEditingController();  // 텍스트 입력 필드 제어용
  // Map을 사용해서 할일(title)과 완료 여부(isDone)를 함께 저장
  // 예: {"title": "밥먹기", "isDone": false}
  List<Map<String, Object>> list = [];

  // ============================================
  // [2단계] 함수 정의 - 버튼을 눌렀을 때 실행할 동작들
  // build 함수 위에 정의하면, build 함수 안에서 이 함수들을 호출할 수 있어요!
  // ============================================
  
  // 할일 추가 함수 - "추가" 버튼을 누르면 이 함수가 실행됨
  void addToDo(){
    String title = txtCtrl.text;  // 입력 필드에서 텍스트 가져오기
    setState(() {  // 화면을 다시 그리기 위해 setState 사용
      // Map 형태로 할일과 완료 여부를 함께 저장
      list.add({"title" : title, "isDone" : false});
      txtCtrl.clear(); // 등록 후 텍스트 필드에서 지우기
    });
  }

  // ============================================
  // [3단계] build 함수 - 화면을 그리는 함수
  // Flutter는 위젯을 계속 감싸는 방식으로 화면을 만듭니다!
  // 실제 작성 순서: 위에서부터 구조를 잡고 → body 안의 내용은 안쪽부터 작성!
  // ============================================
  @override
  Widget build(BuildContext context) {
    // [작성 순서 1] 가장 먼저: Scaffold로 전체 화면 구조 잡기
    return Scaffold(  // 화면의 기본 구조(바디, 앱바 등)를 제공
        // [작성 순서 2] AppBar 추가 (상단 바) - 거의 처음에 작성!
        appBar: AppBar(  // 상단 앱바
          title : Text("할 일"),  // 앱바 제목
          centerTitle: true,  // 제목을 중앙에 배치
        ),
        // [작성 순서 3] body의 전체 구조: Column으로 세로 배치
        body : Column(  // 세로로 위젯들을 나열
          // ⭐ children은 여러 위젯을 담는 리스트입니다!
          // Column, Row 같은 배치 위젯에서 화면을 구성할 때 자주 사용해요!
          children: [
            // [작성 순서 6] Row로 가로 배치 (TextField와 Button을 감쌈)
            Row(  // 가로로 위젯들을 나열
              // ⭐ Row도 children을 사용! 여러 위젯을 가로로 배치할 때 필요해요!
              children: [
                // [작성 순서 7] Expanded와 Padding으로 TextField 감싸기
                Expanded(  // TextField가 남은 공간을 모두 차지하도록
                    child: Padding(  // 여백을 주기 위해 감싸기
                      padding: const EdgeInsets.all(20),
                      // [작성 순서 8] 가장 안쪽: TextField부터 작성!
                      child: TextField(
                        controller: txtCtrl,  // 위에서 선언한 컨트롤러 연결
                        decoration: InputDecoration(
                          hintText: "할 일 입력 하셔",  // 입력 필드 안내 문구
                        ),
                      ),
                    )
                ),
                SizedBox(width: 20,),  // TextField와 버튼 사이 간격
                // [작성 순서 9] ElevatedButton 작성
                ElevatedButton(  // "추가" 버튼
                    onPressed: addToDo,  // 버튼을 누르면 addToDo 함수 실행
                    child: Text("추가")
                )
              ],
            ),
            
            // [작성 순서 4] Expanded로 ListView 감싸기
            Expanded(  // 남은 공간을 모두 차지하도록
                child: list.isEmpty  // 리스트가 비어있는지 확인
                    ? Center(child: Text("할 일 없음"),)  // 비어있으면 "할 일 없음" 표시
                    // [작성 순서 5] ListView.builder로 ListTile들 감싸기
                    // ⭐ ListView.builder는 children을 직접 쓰지 않고 itemBuilder를 사용해요!
                    // 동적으로 리스트를 생성할 때는 itemBuilder가 더 효율적입니다!
                    : ListView.builder(  // 리스트를 동적으로 생성
                  itemCount: list.length,  // 리스트 항목 개수
                  itemBuilder: (context, index) {  // 각 항목을 어떻게 그릴지 정의
                    Map item = list[index];  // 현재 항목의 Map 가져오기
                    // [작성 순서 10] 가장 안쪽: ListTile부터 작성! (체크박스, 텍스트, 삭제버튼)
                    return ListTile(  // 리스트의 한 줄
                      title : Text(
                          item["title"],  // 할일 내용 표시
                          style : TextStyle(
                            // 완료된 항목은 취소선 표시
                            decoration: item["isDone"] ? TextDecoration.lineThrough : null,
                          )
                      ),
                      leading: Checkbox(  // 왼쪽에 체크박스
                        value: item["isDone"],  // 완료 여부에 따라 체크박스 상태 결정
                        onChanged: (value) {  // 체크박스를 클릭하면 실행
                          setState(() {  // 화면을 다시 그리기 위해 setState 사용
                            item["isDone"] = value;  // 완료 여부 업데이트
                          });
                        },
                      ),
                      trailing: IconButton(  // 오른쪽에 삭제 버튼
                          onPressed: () {  // 삭제 버튼을 누르면 실행
                            setState(() {  // 화면을 다시 그리기 위해 setState 사용
                              list.removeAt(index);  // 리스트에서 해당 인덱스의 항목 제거
                              // 삭제 완료 메시지 표시
                              Fluttertoast.showToast(
                                  msg: "삭제되었습니다.",
                                  toastLength: Toast.LENGTH_LONG ,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.grey[200],
                                  textColor: Colors.black,
                                  fontSize: 16.0
                              );
                            });
                          },
                          icon: Icon(Icons.delete)  // 삭제 아이콘
                      ),
                    );
                  },
                )

            )
          ],
        )
    );
  }
}
