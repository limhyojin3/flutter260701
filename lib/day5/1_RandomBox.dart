import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random ran = Random();
  List<Widget> list = [];
  List<int> intList = [];

  void createBox(){//박스 재배치
    List<Widget> tempList = [];
    List<int> tempIntList = [];

    for(int i=1; i<=10; i++){
      tempIntList.add(i);

      tempList.add(
          Positioned(
            //ran.nextDouble() -> 0.0~1.0
              left: ran.nextDouble() * (MediaQuery.of(context).size.width - 50),
              top: ran.nextDouble() * (MediaQuery.of(context).size.height - 100),
              child: GestureDetector(
                  onTap: (){
                    removeBox(i);
                  },
                  child: Container(
                    width: 50, height: 50,
                    color: Colors.green[100],
                    child: Center(
                      child: Text("$i"),
                    ),
                  )
              )
          )
      );
    }
    setState(() {
      list = tempList;
      intList = tempIntList;
    });

    print(list);
    print(intList);
  }

  void removeBox(i){
    if(i == intList[0]){
      print(i);
      setState(() {
        list.removeAt(0);
        intList.removeAt(0);
      });
      print(list);
      print(intList);
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded( //"남은 세로 공간을 전부 이 Stack에게 몰아줘!"
              child: Stack(  //Positioned 위젯을 관리하는 상위 위젯
                children: list,
              ),
            ),
            Container(  //height:50 인 영역 차지
              height: 50, color: Colors.grey[100],
              child: Center(
                child: ElevatedButton(
                    onPressed: createBox,
                    child: Text("랜덤박스생성!")
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


