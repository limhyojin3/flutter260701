import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //디버그 띠 show/off
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title:Text("테스트!"),
          backgroundColor: Colors.blue[100],
        ),
        drawer: Drawer(), 
        body : Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,//Column으로 묶인 애들을 대상으로 정렬
            children: [
              Text("가운데",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50
                )
              ),
              SizedBox(height: 20,),
              IconButton(onPressed:(){},
                icon: Icon(Icons.star,
                  color: Colors.yellow,
                  size: 200
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Center(
                  child: Text("네모 박스",
                    style: TextStyle(color: Colors.white)
                  )
                ),
                color: Colors.black,
                width: 100,
                height: 100,
              )
            ],
          ),
        )
      ),
    );
  }
}
