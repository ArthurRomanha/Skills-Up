import 'package:flutter/material.dart';

void main() {
  runApp(MyApp("Skills Up", 50));
  // runApp(
  //   MaterialApp(
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text(
  //           "Olá",
  //         ),
  //       ),

  //       body: Center(
  //         child: Text(
  //           "Vilela Tchola",
  //           style: TextStyle(fontSize: 20.0, color: Colors.black),
  //         ),
  //       ),
  //     ),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  final String title;
  final int value;

  const MyApp(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(title,)),
        body: Text(value.toString()),
      ),
    );
  }
}