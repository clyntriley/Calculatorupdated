import 'package:flutter/material.dart';
import 'calculator_page.dart';




class MyHistoryApp extends StatelessWidget {
  const MyHistoryApp({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      appBar: AppBar(title: const Text('Third screen')),
      body: Center(
        child: Column(
          children: <Widget> [
            Text(
              'Equation: $text',
              style: const TextStyle(fontSize: 15),
            ),
            Center(
              child: Text('timestamp: $now',
                  style: const TextStyle(fontSize: 15)),
            )
          ]

        )

      ),
    );
  }
}


