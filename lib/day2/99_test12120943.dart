import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: '숫자증가~~'),
    );
  }
}







class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int num = 0;
  var _color = Colors.purple[200];
  // var _colorb = Colors.blue[200];



  // void _incrementCounter() {
  //   setState(() {
  //     num++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),

      body: Container(
        child: Column(
          children: [

            Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("버튼 누를시 숫자 증가"),
                      Text(num.toString())
                    ],
                  ),
                )

            ),
            Align(
                child: Container(
                   height: 100,
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: (){

                          setState(() {
                            num = num + 1;
                            // if( num%2 == 0){
                            //   _color = Colors.purple[200];
                            // }else{
                            //   _color = Colors.blue[500];
                            // }


                          });
                        },
                        child: Text("+"),
                        style : ElevatedButton.styleFrom(

                          // backgroundColor: _color, // if문 동작용
                          backgroundColor: num % 2 == 1 ? Colors.blue[200] : Colors.purple[200]

                          // shape: RoundedRectangleBorder(
                            // borderRadius: BorderRadius.zero
                          // )
                        )
                    )
                )

            )
            
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
          ],
        ),
      ),


      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
