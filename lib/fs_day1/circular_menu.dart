import 'package:flutter/material.dart';
import 'package:circular_menu/circular_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CircularMenuEx(),
    );
  }
}

class CircularMenuEx extends StatefulWidget {
  const CircularMenuEx({super.key});

  @override
  State<CircularMenuEx> createState() => _CircularMenuExState();
}

class _CircularMenuExState extends State<CircularMenuEx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CircularMenu(
            alignment: Alignment.center,
            toggleButtonColor: Colors.greenAccent,
            items: [
              CircularMenuItem(
                icon: Icons.home,
                onTap: () {},
                color: Colors.pink[300],
              ),
              CircularMenuItem(
                  icon: Icons.search, onTap: () {}, color : Colors.green[300]
              ),
              CircularMenuItem(
                  icon: Icons.settings, onTap: () {}, color : Colors.yellow[500]
              ),
              CircularMenuItem(
                  icon: Icons.star, onTap: () {}, color : Colors.blue[200]
              ),
              CircularMenuItem(
                  icon: Icons.pages, onTap: () {}, color : Colors.purple[300]),
            ])
    );
  }
}