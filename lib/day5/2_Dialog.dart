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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDialog()
    );
  }
}

class MyDialog extends StatefulWidget {
  const MyDialog({super.key});

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("삭제"),
                      content: Text("정말 삭제?"),
                      actions: [
                        TextButton(
                            onPressed: (){},
                            child: Text("삭제")
                        ),TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text("취소"),
                        )
                      ]
                    );
                  }
              );
            },
            child: Text("클릭!")
        ),
      ),
    );
  }
}
