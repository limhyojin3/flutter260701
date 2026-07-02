import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> labels = [
      'C', '(', '%', '/',
      '7', '8', '9', '*',
      '4', '5', '6', '-',
      '1', '2', '3', '+',
      '0', '00', '.', '='
    ];
    return MaterialApp(  //최상위
        home : Scaffold(
            appBar: AppBar(title : Text("계산기")),
            body : Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  MyText(),
                  MyText(),
                  MyText(),
                  SizedBox(height: 10,),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6
                      ),
                      itemCount: labels.length,
                      itemBuilder: (context, index) {
                        return ElevatedButton(
                            onPressed: (){},
                            child: Text(labels[index], style:TextStyle(color : Colors.black, fontSize: 30)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: (index+1) % 4 == 0 || index < 4 ? Colors.blue[100] : Colors.grey[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero
                                )
                            )
                        );
                      },
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController numCtrl = TextEditingController();

    return TextField(
      controller: numCtrl,
      // obscureText: true,
      textAlign: TextAlign.end,
      decoration: InputDecoration(
        labelText: "숫자",
        hintText: "숫자 입력",
        prefixIcon: Icon(Icons.calculate),
        suffixIcon: Icon(Icons.check_circle, color: Colors.green,),
        border : OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[100],
        // enabled: false

      ),
    );
  }
}
