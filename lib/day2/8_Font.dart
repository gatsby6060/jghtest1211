import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(

          child: ElevatedButton(
              onPressed: (){
                Fluttertoast.showToast(
                  // msg: "This is Center Short Toast",
                    msg: "클릭되었습니당!!!!!!!!!!",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey[500],
                    textColor: Colors.white,
                    fontSize: 28.5
                );
              },
              child:
                Text(
                  'This is Google Fonts',
                  style: GoogleFonts.acme(
                    textStyle: const TextStyle(
                        color: Colors.red,
                        letterSpacing: .5,
                        fontSize: 42.0
                    ),
                  ),
                ),
          ),



        ),
      ),
    );
  }
}
