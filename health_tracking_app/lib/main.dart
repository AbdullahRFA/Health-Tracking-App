// Import the material library from Flutter, which provides Material Design widgets.
import 'package:flutter/material.dart';
// Import the dart:math library to use mathematical functions like 'pow'.
import 'dart:math';
// Import the flutter_localizations library to enable localization for the app.
import 'package:flutter_localizations/flutter_localizations.dart';
// Import the generated AppLocalizations for handling translations.
import 'package:health_tracking_app/l10n/app_localizations.dart';

// The main function, which is the entry point of the application.
void main() {
  // runApp is a Flutter function that inflates the given widget and attaches it to the screen.
  runApp(const BMICalculatorApp());
}

// This is the root widget of the application. It's a StatefulWidget because its state can change (in this case, the locale).
class BMICalculatorApp extends StatefulWidget {
  // The constructor for the BMICalculatorApp widget.
  const BMICalculatorApp({super.key});

  @override
  // Creates the mutable state for this widget.
  State<BMICalculatorApp> createState() => _BMICalculatorAppState();
}

// This is the state class for the BMICalculatorApp widget.
class _BMICalculatorAppState extends State<BMICalculatorApp> {
  // A private variable to hold the current locale of the app. It's initialized to English ('en').
  Locale _locale = const Locale('en');

  // A method to change the locale of the app.
  void _setLocale(Locale locale) {
    // setState is called to rebuild the widget with the new locale.
    setState(() {
      _locale = locale;
    });
  }

  @override
  // The build method describes the part of the user interface represented by this widget.
  Widget build(BuildContext context) {
    // MaterialApp is a convenience widget that wraps a number of widgets that are commonly required for Material Design applications.
    return MaterialApp(
      // The title of the application, used by the operating system.
      title: 'BMI Calculator',
      // The theme data for the application.
      theme: ThemeData(
        // The primary color swatch for the app.
        primarySwatch: Colors.deepPurple,
        // The default background color for Scaffold widgets.
        scaffoldBackgroundColor: Colors.white,
        // The default text styling for the app.
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      // The current locale of the app.
      locale: _locale,
      // The list of locales that the app supports.
      supportedLocales: const [Locale('en'), Locale('bn')],
      // The delegates for this app's Localizations widget.
      localizationsDelegates: const [
        // A delegate for the app-specific localizations.
        AppLocalizations.delegate,
        // A delegate for the Material Design widgets.
        GlobalMaterialLocalizations.delegate,
        // A delegate for the text direction for widgets.
        GlobalWidgetsLocalizations.delegate,
        // A delegate for Cupertino (iOS-style) widgets.
        GlobalCupertinoLocalizations.delegate,
      ],
      // The home screen of the app.
      home: BMIScreen(onLocaleChange: _setLocale),
      // Hides the debug banner in the top-right corner.
      debugShowCheckedModeBanner: false,
    );
  }
}

// This widget represents the main screen of the BMI calculator.
class BMIScreen extends StatefulWidget {
  // A callback function to change the locale.
  final ValueChanged<Locale> onLocaleChange;
  // The constructor for the BMIScreen widget.
  const BMIScreen({super.key, required this.onLocaleChange});

  @override
  // Creates the mutable state for this widget.
  State<BMIScreen> createState() => _BMIScreenState();
}

// This is the state class for the BMIScreen widget.
class _BMIScreenState extends State<BMIScreen> {
  // A boolean to track if the selected gender is male.
  bool isMale = true;
  // A double to store the height value from the slider.
  double height = 170.0;
  // A double to store the weight value from the slider.
  double weight = 60.0;
  // A double to store the age value from the slider.
  double age = 25.0;

  // This method calculates the BMI and shows the result in a dialog.
  void _calculateBMI() {
    // Get the localized strings.
    final loc = AppLocalizations.of(context)!;
    // Convert height from centimeters to meters.
    final heightInMeters = height / 100;
    // Calculate the BMI using the formula: weight / (height in meters)^2.
    final bmi = weight / pow(heightInMeters, 2);

    // Variables to hold the result category, advice, and color based on the BMI value.
    late final String category;
    late final String advice;
    late final Color color;

    // Determine the BMI category and corresponding advice and color.
    if (bmi < 18.5) {
      category = loc.underweight;
      advice = loc.underweightSuggestion;
      color = Colors.blueGrey;
    } else if (bmi < 25) {
      category = loc.normal;
      advice = loc.normalSuggestion;
      color = Colors.green;
    } else if (bmi < 30) {
      category = loc.overweight;
      advice = loc.overweightSuggestion;
      color = Colors.orangeAccent;
    } else {
      category = loc.obese;
      advice = loc.obeseSuggestion;
      color = Colors.red;
    }

    // Show a dialog with the BMI result.
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        // The shape of the dialog.
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        // The title of the dialog.
        title: Text(loc.bmiResult, textAlign: TextAlign.center),
        // The content of the dialog.
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Display the BMI value.
              Text(
                bmi.toStringAsFixed(1),
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: color),
              ),
              // Add some vertical space.
              const SizedBox(height: 8),
              // Display the BMI category.
              Text(
                "${loc.category}: $category",
                style: TextStyle(fontSize: 22, color: color),
                textAlign: TextAlign.center,
              ),
              // Add some vertical space.
              const SizedBox(height: 16),
              // Display the advice.
              Text(
                advice,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        // The actions of the dialog.
        actions: [
          // Center the close button.
          Center(
            // A button to close the dialog.
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(loc.close),
            ),
          )
        ],
      ),
    );
  }

  // A helper method to build the gender selection button.
  Widget _buildGenderButton(String label, IconData icon, bool selected) {
    // Expanded widget makes its child fill the available space.
    return Expanded(
      // GestureDetector detects gestures.
      child: GestureDetector(
        // The callback that is called when the user taps on this widget.
        onTap: () => setState(() => isMale = label == AppLocalizations.of(context)!.male),
        // AnimatedContainer provides a smooth transition between the old and new properties.
        child: AnimatedContainer(
          // The duration of the animation.
          duration: const Duration(milliseconds: 300),
          // The padding inside the container.
          padding: const EdgeInsets.symmetric(vertical: 15),
          // The margin around the container.
          margin: const EdgeInsets.all(8),
          // The decoration to paint behind the child.
          decoration: BoxDecoration(
            // The color of the container.
            color: selected ? Colors.white : Colors.white.withOpacity(0.2),
            // The border radius of the container.
            borderRadius: BorderRadius.circular(12),
            // The box shadow to cast.
            boxShadow: selected
                ? [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))]
                : [],
          ),
          // The child of the container.
          child: Column(
            children: [
              // The icon for the gender.
              Icon(icon, size: 50, color: selected ? Colors.deepPurple : Colors.white),
              // Add some vertical space.
              const SizedBox(height: 8),
              // The label for the gender.
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
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

  // A helper method to build the slider widget.
  Widget _buildSlider(String label, double value, double min, double max, String unit, ValueChanged<double> onChanged) {
    // A container for the slider.
    return Container(
      // The margin around the container.
      margin: const EdgeInsets.symmetric(vertical: 4),
      // The padding inside the container.
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // The decoration of the container.
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      // The child of the container.
      child: Column(
        children: [
          // The label for the slider.
          Text("$label ($unit)", style: const TextStyle(color: Colors.white, fontSize: 16)),
          // The current value of the slider.
          Text(value.toStringAsFixed(0), style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
          // The slider widget.
          Slider(
            // The minimum value of the slider.
            min: min,
            // The maximum value of the slider.
            max: max,
            // The current value of the slider.
            value: value,
            // The callback that is called when the user drags the slider.
            onChanged: onChanged,
            // The color of the active part of the slider.
            activeColor: Colors.white,
            // The color of the inactive part of the slider.
            inactiveColor: Colors.white54,
          ),
        ],
      ),
    );
  }

  @override
  // The build method for the BMIScreen widget.
  Widget build(BuildContext context) {
    // Get the localized strings.
    final loc = AppLocalizations.of(context)!;

    // Scaffold implements the basic Material Design visual layout structure.
    return Scaffold(
      // The app bar to display at the top of the scaffold.
      appBar: AppBar(
        // The title of the app bar.
        title: Text(loc.appTitle),
        // Whether to center the title.
        centerTitle: true,
        // The z-coordinate at which to place this app bar relative to its parent.
        elevation: 10,
        // The background color of the app bar.
        backgroundColor: Colors.deepPurple,
      ),
      // The primary content of the scaffold.
      body: SafeArea(
        // A widget that insets its child by sufficient padding to avoid intrusions by the operating system.
        child: SingleChildScrollView(
          // This makes the content scrollable if it overflows the screen.
          child: Container(
            // The padding of the container.
            padding: const EdgeInsets.all(12),
            // The decoration of the container.
            decoration: const BoxDecoration(
              // A gradient to use for the background.
              gradient: LinearGradient(
                colors: [Color(0xFF9417EF), Color(0xFF9573A3)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            // The child of the container.
            child: Column(
              // How the children should be placed along the cross axis.
              crossAxisAlignment: CrossAxisAlignment.center,
              // The children of the column.
              children: [
                // Add some vertical space.
                const SizedBox(height: 5),
                // The title text.
                Text(
                  loc.enterDetails,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                // Add some vertical space.
                const SizedBox(height: 15),
                // A row to hold the gender selection buttons.
                Row(
                  children: [
                    // The male gender button.
                    _buildGenderButton(loc.male, Icons.male, isMale),
                    // The female gender button.
                    _buildGenderButton(loc.female, Icons.female, !isMale),
                  ],
                ),
                // Add some vertical space.
                const SizedBox(height: 15),
                // The height slider.
                _buildSlider(loc.height, height, 100, 220, "cm", (value) => setState(() => height = value)),
                // The weight slider.
                _buildSlider(loc.weight, weight, 30, 150, "kg", (value) => setState(() => weight = value)),
                // The age slider.
                _buildSlider(loc.age, age, 10, 100, "yrs", (value) => setState(() => age = value)),
                // Add some vertical space.
                const SizedBox(height: 20),
                // The calculate button.
                ElevatedButton(
                  onPressed: _calculateBMI,
                  // The style of the button.
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 80),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  // The child of the button.
                  child: Text(
                    loc.calculate,
                    style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                // Add some vertical space.
                const SizedBox(height: 15),
                // A row to hold the language selection buttons.
                Row(
                  // How the children should be placed along the main axis.
                  mainAxisAlignment: MainAxisAlignment.center,
                  // The children of the row.
                  children: [
                    // The English language button.
                    ElevatedButton(
                      onPressed: () => widget.onLocaleChange(const Locale('en')),
                      child: const Text("English"),
                    ),
                    // Add some horizontal space.
                    const SizedBox(width: 10),
                    // The Bengali language button.
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
