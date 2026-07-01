import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//stateless(정적), stateful(동적,긴장상태)

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //appBar(상단), body(중), bottomNavigationBar(하단)
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, //Row로 묶인애들을 대상으로 정렬
            children: [
              Icon(Icons.home, size : 30),
              IconButton(onPressed: (){
                print("아이콘 버튼 클릭 됨!");
              }, icon: Icon(Icons.home, size : 30)),
              ElevatedButton(onPressed: (){
                print("일반 버튼 클릭 됨!");
              }, child: Text("클릭!"))
            ],
          )
        )
      ),
    );
  }
}
