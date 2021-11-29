import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




class MyHistoryApp extends StatelessWidget {
  MyHistoryApp({Key? key ,required this.text}) : super(key: key);

    String text;

  void initState() {
    super.toString();
    loadHistory();
  }

   loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('history')! ;
      
  }
   saveHistory() async {
    final prefs = await SharedPreferences.getInstance();
      prefs.setString('history', text);
  
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
        Text('Equation: $text',style: const TextStyle(fontSize: 15)),

        ElevatedButton(
          onPressed: () {
            loadHistory();
            saveHistory();
          },
          child: const Text('Save'),
        ),

        Center(
          child: Text('timestamp: $now',
              style: const TextStyle(fontSize: 15)),
        )
      ],
    ),
    );
  }
}










