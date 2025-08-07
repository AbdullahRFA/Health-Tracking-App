import 'package:flutter/material.dart';
import '../utils/health_goal.dart';

class BMIResultScreen extends StatelessWidget {
  final double bmi;
  final int age;

  const BMIResultScreen({required this.bmi, required this.age});

  @override
  Widget build(BuildContext context) {
    final goal = getHealthGoal(bmi, age);

    return Scaffold(
      appBar: AppBar(title: Text('Your BMI Result')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your BMI: ${bmi.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            Text(
              'Recommended Health Goal:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            Text(
              goal,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
