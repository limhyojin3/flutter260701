import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Offset p = Offset(100, 150); // x = 100, y = 150

  late List<Widget> list = [
    Positioned(
      top: p.dx, left: p.dy,
      child: Container(
        height: 50, width: 50, color: Colors.green,
      ),
    ),
    Positioned(
      top: 40, left: 40,
      child: Container(
        height: 50, width: 50, color: Colors.greenAccent,
      ),
    ),
    Positioned(
      top: 60, left: 60,
      child: Container(
        height: 50, width: 50, color: Colors.lightGreenAccent,
      ),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(  //Positioned 위젯을 관리하는 상위 위젯
          children: list,
        ),
      ),
    );
  }
}
