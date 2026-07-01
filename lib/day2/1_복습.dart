import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.black26
      ),
      home: Scaffold(    //Scaffold : 상단,중앙,하단으로 나눠주기 편함
        appBar: AppBar(
          title: Text(
            "타이틀!",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blue,
              letterSpacing: 2,
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
              decorationStyle: TextDecorationStyle.dashed
            ),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.settings)), //Icon(Icons.settings) <= 객체
            IconButton(onPressed: (){}, icon: Icon(Icons.home))
          ],
        ),
        drawer: Drawer(),
        body: Center(
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: (){
                    print("버튼 클릭!");
                  },
                  child: Text("선택!"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    foregroundColor: Colors.pinkAccent,
                    shadowColor: Colors.black,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    side : BorderSide(
                      color: Color(0xFF050000),
                      width: 1
                    )
                  ),
              ),
              MyButton(text : Text("안녕?")),
              MyButton(text : Text("ㅋㅋ")),
              MyButton(text : Text("Hello")),
              MyButton(text : Text("Flutter")),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Text text;
  const MyButton({super.key, required Text this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        print("버튼 클릭!");
      },
      child: text,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlueAccent,
          foregroundColor: Colors.pinkAccent,
          shadowColor: Colors.black,
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          side : BorderSide(
              color: Color(0xFF050000),
              width: 1
          )
      ),
    );
  }
}


