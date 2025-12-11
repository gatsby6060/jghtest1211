import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar : AppBar(
          backgroundColor: Colors.blue[200],
          title: Text("상단 영역!! 타이틀!"),
        ),
        drawer:Drawer(),
        body : ListView(
          children: [
            ListTile(
              leading: Image.asset("dog.jpg", width:60, height: 60, fit : BoxFit.contain),
              title: Text("아주 좋은 노트북강아지", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("150,000원, 인천 부평동"),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
              onTap: (){
                print("제품 틀릭했음!");
              }
            ),
            Divider(height: 1, color: Colors.grey),
            ListTile(
                leading: Image.asset("car.png", width:60, height: 60, fit : BoxFit.contain),
                title: Text("자전거용자동차", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("220,000원, 인천 부평동"),
                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                onTap: (){
                  print("제품 틀릭했음!");
                }
            ),
            
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.dangerous),iconSize: 50,),
              IconButton(onPressed: (){}, icon: Icon(Icons.home),iconSize: 50,),
              IconButton(onPressed: (){}, icon: Icon(Icons.backspace),iconSize: 50,),
            ],
          ),
        ),
      )
    );
  }
}
