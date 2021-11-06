import 'dart:math';
import 'package:flutter/material.dart';
import 'calculator_history.dart';
import 'converter_page.dart';



class MyCalculatorApp extends StatelessWidget {
  const MyCalculatorApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: const MyHomePage(title: 'Calculator Page'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();



}



class _MyHomePageState extends State<MyHomePage> {
  late int num1;
  late int num2;
  late int answer = 0;
  late String operator= '';


  var numbers = [];

  addHistory() {
    numbers.add('$num1 $operator $num2 = $answer');

  }



  void thirdScreen(BuildContext context) {
  String textToSend = numbers.toString()  ;
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyHistoryApp(text: textToSend),
      ));


}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (digit) => num1=int.parse(digit),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a first Number'
              ),
            ),
            TextField(
              onChanged: (digit) => num2=int.parse(digit),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a Second Number'
              ),
            ),

            TextField(
              onChanged: (digit) => operator=(digit),
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a Operator'
              ),
            ),


            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (operator == '+') {
                        answer=num1+num2;
                        addHistory();
                      } else if (operator == '-'){
                        answer=num1-num2;
                        addHistory();
                      } else if (operator == '*'){
                        answer=num1*num2;
                        addHistory();
                      } else if (operator == '/'){
                        answer= num1~/num2;
                        addHistory();
                      } else if (operator == '^'){
                        answer =pow(num1, num2).toInt();
                        addHistory();
                      }
                    });
                  },
                  child: const Text('Solve'),
                ),

              ],
            ),
            Text("$answer",style: const TextStyle(fontSize: 30)),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ConverterPage()),
                );
              },
              child: const Text('Converter'),
            ),
            ElevatedButton(
              onPressed: () {
                thirdScreen(context);
              },
              child: const Text('History Page'),
            ),

          ],
        ),
      ),
    );


  }
}