import 'package:flutter/material.dart';
import 'calculator_page.dart';

class MyConverterApp extends StatelessWidget {
  const MyConverterApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home:  const MyHomePage(),
    );




  }
}

// Second page
class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  double base=0, result= 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second page"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              onChanged: (digit) => base=double.parse(digit),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Number'
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = (base * 0.621371).toDouble();
                });
              },
              child: const Text('Kilometers to Miles'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = (base * 1.609).toDouble();
                });
              },
              child: const Text('Miles to Kilometers'),
            ),



            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Calculator'),
            ),
            Text(result.toString(),style: const TextStyle(fontSize: 30))
          ],
        ),
      ),
    );
  }
}
