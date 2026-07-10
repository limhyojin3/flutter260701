import 'package:flutter/material.dart';
import 'package:flutter260629/fs_day1/Payment.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RequestPayment(),
    );
  }
}

class RequestPayment extends StatefulWidget {
  const RequestPayment({super.key});

  @override
  State<RequestPayment> createState() => _RequestPaymentState();
}

class _RequestPaymentState extends State<RequestPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Payment(),
                )
              );
            },
            child: Text("결제하기")
        ),
      ),
    );
  }
}
