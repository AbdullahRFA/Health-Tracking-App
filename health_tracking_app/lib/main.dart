import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const BMIScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  bool isMale = true;
  double height = 170.0;
  double weight = 60.0;
  double age = 25.0;

  void _calculateBMI() {
    double heightInMeters = height / 100;
    double bmi = weight / pow(heightInMeters, 2);

    String result = '';
    Color resultColor = Colors.black;

    if (bmi < 18.5) {
      result = "Underweight";
      resultColor = Colors.blueGrey;
    } else if (bmi >= 18.5 && bmi < 25) {
      result = "Normal";
      resultColor = Colors.green;
    } else if (bmi >= 25 && bmi < 30) {
      result = "Overweight";
      resultColor = Colors.orangeAccent;
    } else {
      result = "Obese";
      resultColor = Colors.red;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("BMI Result", textAlign: TextAlign.center),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              bmi.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: resultColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Category: $result",
              style: TextStyle(fontSize: 22, color: resultColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGenderButton(String label, IconData icon, bool selected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = label == "Male";
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: 20),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(icon, size: 60, color: selected ? Colors.deepPurple : Colors.white),
              const SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: selected ? Colors.deepPurple : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlider(String label, double value, double min, double max, String unit, ValueChanged<double> onChanged) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            "$label ($unit)",
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            value.toStringAsFixed(0),
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Slider(
            min: min,
            max: max,
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            inactiveColor: Colors.white54,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF9417EF), Color(0xFF9573A3)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Enter Your Details",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _buildGenderButton("Male", Icons.male, isMale),
                    _buildGenderButton("Female", Icons.female, !isMale),
                  ],
                ),
                const SizedBox(height: 20),
                _buildSlider("Height", height, 100, 220, "cm", (value) {
                  setState(() => height = value);
                }),
                _buildSlider("Weight", weight, 30, 150, "kg", (value) {
                  setState(() => weight = value);
                }),
                _buildSlider("Age", age, 10, 100, "yrs", (value) {
                  setState(() => age = value);
                }),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _calculateBMI,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Calculate",
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}