// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget numbButton(String btnText, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () => {calculate(btnText)},
      // ignore: sort_child_properties_last
      child: Text(
        btnText,
        style: TextStyle(fontSize: 25, color: txtColor),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(70, 70),
        primary: btnColor,
      ),
    );
  }

  // TextField(
  //         decoration: InputDecoration(
  //   hintText: 'Enter your name'
  // ),)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black, fontSize: 80),
                ),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            numbButton("C", Colors.orange, Colors.white),
            numbButton("()", Colors.orange, Colors.white),
            numbButton("%", Colors.orange, Colors.white),
            numbButton("÷", Colors.orange, Colors.white),
          ]),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            numbButton("7", Color.fromARGB(235, 240, 238, 238), Colors.black),
            numbButton("8", Color.fromARGB(235, 240, 238, 238), Colors.black),
            numbButton("9", Color.fromARGB(235, 240, 238, 238), Colors.black),
            numbButton("x", Colors.orange, Colors.white),
          ]),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            numbButton("4", Color.fromARGB(235, 240, 238, 238), Colors.black),
            numbButton("5", Color.fromARGB(235, 240, 238, 238), Colors.black),
            numbButton("6", Color.fromARGB(235, 240, 238, 238), Colors.black),
            numbButton("-", Colors.orange, Colors.white),
          ]),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            numbButton("1", Color.fromARGB(235, 240, 238, 238), Colors.black),
            numbButton("2", Color.fromARGB(235, 240, 238, 238), Colors.black),
            numbButton("3", Color.fromARGB(235, 240, 238, 238), Colors.black),
            numbButton("+", Colors.orange, Colors.white),
          ]),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            numbButton("0", Color.fromARGB(235, 240, 238, 238), Colors.black),
            numbButton(".", Color.fromARGB(235, 240, 238, 238), Colors.black),
            numbButton("←", Colors.orange, Colors.white),
            numbButton("=", Colors.orange, Colors.white),
          ]),
          SizedBox(height: 50),
        ]),
      ),
    );
  }

  int firstNumber = 0;
  int secondNumber = 0;
  String result = "0";
  String text = "0";
  String operation = "";

  void calculate(String btnText) {
    if (btnText == "C" || btnText == "←") {
      result = "0";
      text = "0";
      firstNumber = 0;
      secondNumber = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "÷") {
      firstNumber = int.parse(text);
      result = "";
      operation = btnText;
    } else if (btnText == "=") {
      secondNumber = int.parse(text);
      if (operation == "+") {
        result = (firstNumber + secondNumber).toString();
      }
      if (operation == "-") {
        result = (firstNumber - secondNumber).toString();
      }
      if (operation == "x") {
        result = (firstNumber * secondNumber).toString();
      }
      if (operation == "÷") {
        result = (firstNumber ~/ secondNumber).toString();
      } else if (operation == "÷") {
        (secondNumber == 0);
        text = "Error";
      }
    } else {
      result = int.parse(text + btnText).toString();
    }
    setState(() {
      text = result;
    });
  }
}
