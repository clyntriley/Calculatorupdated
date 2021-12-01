import 'package:flutter/material.dart';
import "calculator_page.dart";



class MyHistoryApp extends StatefulWidget {
  const MyHistoryApp({Key? key}) : super(key: key);
   static String text = '';

  @override
  _MyHistoryPageState createState() => _MyHistoryPageState();
}



class _MyHistoryPageState extends State<MyHistoryApp> {
  String _text = '';


  @override
  void initState() {
    super.initState();
    getNumberHistory().then(updateNumber);
  }

  void updateNumber(String number) {
    setState(() {
      _text = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text("History page"),
      ),
      body: Column(
        children: [
          Text('Equation: $_text', style: const TextStyle(fontSize: 15)),
          Center(
            child: Text('timestamp: $now',
                style: const TextStyle(fontSize: 15)),
          )
        ],
      ),
    );
  }

}


















