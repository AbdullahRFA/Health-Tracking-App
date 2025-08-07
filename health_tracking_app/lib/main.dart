import 'package:flutter/material.dart';

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
    );
  }
}

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,),
        ),
          centerTitle : true,
        elevation: 10,
      ),
    body: Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors:[
              Color(0xFF9417EF), // corrected hex color format
              Color(0xFF9573A3),
            ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Enter Your Details ",

            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            textAlign: TextAlign.center,

          )
        ],
      ),
    ),
    );
  }

  Widget _buildGenderButton(String label, IconData icon, bool isSelected ){
    return GestureDetector(
      onTap: (){
        
      },
      child: AnimatedContainer(
          duration: Duration(microseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.2)
        ),
      ),
    );
  }
}