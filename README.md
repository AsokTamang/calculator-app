Overview

This is a basic calculator application built using Flutter. It provides simple arithmetic operations such as addition, subtraction, multiplication, and division. The app features a clean user interface and handles input efficiently.

Features

Basic Arithmetic Operations: Perform addition (+), subtraction (-), multiplication (*), and division (/).

Clear Functions:

C clears all stored values and resets the calculator.

CE clears only the current input.

Responsive UI: The app adjusts its layout to different screen sizes.

Error Handling:

Displays ERROR when division by zero is attempted.

Limits input length to prevent display overflow.

How It Works

User Inputs Numbers: Taps on number buttons (0-9) to enter values.

Selects an Operation: Chooses an arithmetic operation (+, -, *, /).

Enters Second Number: Inputs the second operand.

Computes Result: Pressing = performs the calculation and displays the result.

Clearing Options:

C resets everything.

CE clears only the last entry.

Handling Large Numbers: The display is limited to 8 characters to avoid overflow.

Technologies & Properties Used

Flutter Framework: Used for building the UI and managing state.

Material Design Widgets:

MaterialApp: Defines the main structure of the app.

Scaffold: Provides the app layout with an AppBar and Body.

ElevatedButton: Creates buttons for number input and operations.

Column & Row: Used to organize buttons in a structured layout.

Container: Styles the display screen.

State Management:

_CalculatorScreenState manages input, operations, and calculations.

setState() updates the UI dynamically.

Author

Asok Tamang
