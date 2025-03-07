import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculatorApp());
}

class MyCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String currentInput = '0';
  double? previousValue;
  String? operation;

  void onButtonPressed(String input) {
    setState(() {
      if (input == 'C') {
        // Reset everything
        currentInput = '0';
        previousValue = null;
        operation = null;
      } else if (input == 'CE') {
        // Clear current entry
        currentInput = '0';
      } else if (input == '=') {
        // Calculate the result
        if (previousValue != null && operation != null) {
          double newValue = double.tryParse(currentInput) ?? 0;
          switch (operation) {
            case '+':
              currentInput = (previousValue! + newValue).toString();
              break;
            case '-':
              currentInput = (previousValue! - newValue).toString();
              break;
            case '*':
              currentInput = (previousValue! * newValue).toString();
              break;
            case '/':
              if (newValue != 0) {
                currentInput = (previousValue! / newValue).toString();
              } else {
                currentInput = 'ERROR'; // Handle division by zero
              }
              break;
          }
          previousValue = null; // Reset for the next calculation
          operation = null;
        }
      } else if (['+', '-', '*', '/'].contains(input)) {
        // Store the current value and operation
        previousValue = double.tryParse(currentInput);
        operation = input;
        currentInput = '0'; // Reset display for the next number
      } else {
        // Handle number input
        if (currentInput == '0') {
          currentInput = input; // Replace 0 with the new number
        } else {
          currentInput += input; // Append the new number
        }
      }

      // Limit the display to 8 characters
      if (currentInput.length > 8) {
        currentInput = 'OVERFLOW';
      }
    });
  }

  Widget createButton(String label) {
    return ElevatedButton(
      onPressed: () => onButtonPressed(label),
      child: Text(label, style: TextStyle(fontSize: 24)),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(64, 64),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(24),
            child: Text(
              currentInput,
              style: TextStyle(fontSize: 48),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              createButton('1'),
              createButton('2'),
              createButton('3'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              createButton('4'),
              createButton('5'),
              createButton('6'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              createButton('7'),
              createButton('8'),
              createButton('9'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              createButton('CE'),
              createButton('0'),
              createButton('C'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              createButton('+'),
              createButton('-'),
              createButton('*'),
              createButton('/'),
              createButton('='),
            ],
          ),
        ],
      ),
    );
  }
}