import 'package:flutter/material.dart';

/// Entry point of the application
void main() {
  runApp(MyCalculatorApp());
}

/// Main application widget, setting up MaterialApp
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

/// Stateful widget to handle calculator logic and UI updates
class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String currentInput = '0'; // Stores the current number input
  double? previousValue; // Stores the first operand for calculations
  String? operation; // Stores the selected operation

  /// Handles button presses and updates the calculator state
  void onButtonPressed(String input) {
    setState(() {
      if (input == 'C') {
        // Reset everything to initial state
        currentInput = '0';
        previousValue = null;
        operation = null;
      } else if (input == 'CE') {
        // Clear only the current input
        currentInput = '0';
      } else if (input == '=') {
        // Perform the calculation if an operation is set
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
                currentInput = 'ERROR'; // Prevent division by zero
              }
              break;
          }
          previousValue = null; // Reset stored value
          operation = null; // Reset operation
        }
      } else if (['+', '-', '*', '/'].contains(input)) {
        // Store the first number and the operation
        previousValue = double.tryParse(currentInput);
        operation = input;
        currentInput = '0'; // Reset display for next number input
      } else {
        // Handle number inputs
        if (currentInput == '0') {
          currentInput = input; // Replace initial zero
        } else {
          currentInput += input; // Append number to input
        }
      }

      // Limit the display length to prevent overflow
      if (currentInput.length > 8) {
        currentInput = 'OVERFLOW';
      }
    });
  }

  /// Creates a button widget with a specific label
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
          // Display area
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(24),
            child: Text(
              currentInput,
              style: TextStyle(fontSize: 48),
            ),
          ),
          // Number and operation buttons layout
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
              createButton('CE'), // Clear current entry
              createButton('0'),
              createButton('C'),  // Clear all
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
