import 'package:flutter/material.dart';

class BPage extends StatelessWidget {
  final String? msg;  //null을 허용하고싶으면 ?(물음표)를 붙인다.
  const BPage({super.key, this.msg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B페이지!"),
        // automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(msg ?? "B페이지! 전달 받은 값 없음!"), //msg 가 null값인경우 나올 문구
      ),
    );
  }
}
