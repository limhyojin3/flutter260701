import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Expanded(child: Container(color: Colors.grey,)),
            Container(width: 150, color: Colors.blue,),
          ],
        ),
      ),
    );
  }
}
