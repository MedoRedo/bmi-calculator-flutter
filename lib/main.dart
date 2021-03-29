import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        accentColor: Colors.purple,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      onGenerateRoute: (settings) {
        // If you push the PassArguments route
        if (settings.name == '/result') {
          // Cast the arguments to the correct type: ScreenArguments.
          final CalculatorBrain args = settings.arguments;

          // Then, extract the required data from the arguments and
          // pass the data to the correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return ResultsPage(
                bmiResult: args.calculateBMI(),
                interpretation: args.getInterpretation(),
                resultText: args.getResult(),
              );
            },
          );
        }
        return MaterialPageRoute(builder: (context) => InputPage());
      },
    );
  }
}
