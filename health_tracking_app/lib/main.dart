import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_tracking_app/l10n/app_localizations.dart';


void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatefulWidget {
  const BMICalculatorApp({super.key});

  @override
  State<BMICalculatorApp> createState() => _BMICalculatorAppState();
}

class _BMICalculatorAppState extends State<BMICalculatorApp> {
  Locale _locale = const Locale('en');

  void _setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('bn'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: BMIScreen(onLocaleChange: _setLocale),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BMIScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const BMIScreen({super.key, required this.onLocaleChange});

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
    String suggestion = '';
    Color resultColor = Colors.black;

    if (bmi < 18.5) {
      result = AppLocalizations.of(context)!.underweight;
      resultColor = Colors.blueGrey;
      suggestion = AppLocalizations.of(context)!.underweightSuggestion;
    } else if (bmi >= 18.5 && bmi < 25) {
      result = AppLocalizations.of(context)!.normal;
      resultColor = Colors.green;
      suggestion = AppLocalizations.of(context)!.normalSuggestion;
    } else if (bmi >= 25 && bmi < 30) {
      result = AppLocalizations.of(context)!.overweight;
      resultColor = Colors.orangeAccent;
      suggestion = AppLocalizations.of(context)!.overweightSuggestion;
    } else {
      result = AppLocalizations.of(context)!.obese;
      resultColor = Colors.red;
      suggestion = AppLocalizations.of(context)!.obeseSuggestion;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(AppLocalizations.of(context)!.bmiResult, textAlign: TextAlign.center),
        content: SingleChildScrollView(
          child: Column(
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
                "${AppLocalizations.of(context)!.category}: $result",
                style: TextStyle(fontSize: 22, color: resultColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                suggestion,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(AppLocalizations.of(context)!.close),
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
            isMale = label == AppLocalizations.of(context)!.male;
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
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.appTitle),
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
                Text(
                  loc.enterDetails,
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _buildGenderButton(loc.male, Icons.male, isMale),
                    _buildGenderButton(loc.female, Icons.female, !isMale),
                  ],
                ),
                const SizedBox(height: 20),
                _buildSlider(loc.height, height, 100, 220, "cm", (value) {
                  setState(() => height = value);
                }),
                _buildSlider(loc.weight, weight, 30, 150, "kg", (value) {
                  setState(() => weight = value);
                }),
                _buildSlider(loc.age, age, 10, 100, "yrs", (value) {
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
                  child: Text(
                    loc.calculate,
                    style: const TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => widget.onLocaleChange(const Locale('en')),
                      child: const Text("English"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => widget.onLocaleChange(const Locale('bn')),
                      child: const Text("বাংলা"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
