import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = ["김치찌개", "짜장면", "라면", "감자탕"];
    List<Icon> iconList = [
      Icon(Icons.unsubscribe_rounded),
      Icon(Icons.home),
      Icon(Icons.star),
      Icon(Icons.search_rounded)
    ];
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: iconList[index],
              title: Text(list[index]),
              onTap: (){},
            );
          },
        )
      ),
    );
  }
}
