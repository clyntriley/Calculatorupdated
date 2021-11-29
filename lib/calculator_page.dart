import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


import 'calculator_history.dart';
import 'converter_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}
TextEditingController textControllerInput = TextEditingController();
TextEditingController textControllerResult = TextEditingController();

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {




  List<String> numbers = [];

  addHistory() {
    numbers.add(textControllerInput.text + ' = ' + textControllerResult.text );


  }

  void thirdScreen(BuildContext context) {
    String textToSend = numbers.toString();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHistoryApp(text: textToSend),
        ));


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[


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
            child: const Icon(Icons.history, size: 30, color: Colors.black),
            onPressed: () {
              thirdScreen(context);
            },
          ),




          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(

                decoration: const InputDecoration.collapsed(
                    hintText: "0",
                    hintStyle: TextStyle(
                      fontSize: 30,
                    )),
                style: const TextStyle(
                  fontSize: 30,
                ),
                textAlign: TextAlign.right,
                controller: textControllerInput,
                onTap: () =>
                    FocusScope.of(context).requestFocus(FocusNode()),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: const InputDecoration.collapsed(
                    hintText: "0",
                    // fillColor: Colors.deepPurpleAccent,
                    hintStyle: TextStyle()),
                textInputAction: TextInputAction.none,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 32,
                ),
                textAlign: TextAlign.right,
                controller: textControllerResult,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              )
          ),
          const SizedBox( height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buttonAC('AC'),
              buttonClear(),
              button('/',),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              button('7'),
              button('8'),
              button('9'),
              button('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              button('4'),
              button('5'),
              button('6'),
              button('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              button('1'),
              button('2'),
              button('3'),
              button('+',),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              button('0'),
              button('^'),
              buttonEqual('='),
            ],
          ),
          const SizedBox(height: 15.0,)
        ],
      ),
    );
  }



  Widget button(buttontext) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ElevatedButton(
        child: Text(
          buttontext,
          style: const TextStyle(
              fontSize: 28.0, color: Colors.black),
        ),
        onPressed: () {
          setState(() {
            textControllerInput.text = textControllerInput.text + buttontext;

          });
        },
      ),
    );
  }

  Widget buttonClear() {
    return ElevatedButton(
      child: const Icon(Icons.backspace, size: 30, color: Colors.black),
      onPressed: () {
        textControllerInput.text = (textControllerInput.text.isNotEmpty)
            ? (textControllerInput.text.substring(0, textControllerInput.text.length - 1)) : "";
      },
    );
  }
  Widget buttonAC(buttonerase)  {
    return ElevatedButton(
      child: Text(
        buttonerase,
        style: const TextStyle(
            fontSize: 20.0, color: Colors.black),
      ),
      onPressed: () {
        setState(() {
          textControllerInput.text = "";
          textControllerResult.text = "";
        });
      },
    );
  }
  Widget buttonEqual(buttonText) {
    return ElevatedButton(
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 20.0, color: Colors.black),
      ),
      onPressed: () {
        addHistory();
        Parser p = Parser();
        ContextModel cm = ContextModel();
        Expression exp = p.parse(textControllerInput.text);
        setState(() {
          textControllerResult.text = exp.evaluate(EvaluationType.REAL, cm).toString();
        });
      },
    );
  }
}
