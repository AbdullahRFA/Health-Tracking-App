// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'BMI Calculator';

  @override
  String get enterDetails => 'Enter Your Details';

  @override
  String get calculate => 'Calculate';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get height => 'Height';

  @override
  String get weight => 'Weight';

  @override
  String get age => 'Age';

  @override
  String get bmiResult => 'BMI Result';

  @override
  String get category => 'Category';

  @override
  String get close => 'Close';

  @override
  String get underweight => 'Underweight';

  @override
  String get normal => 'Normal';

  @override
  String get overweight => 'Overweight';

  @override
  String get obese => 'Obese';

  @override
  String get underweightSuggestion =>
      'You are underweight. Eat more calorie-dense foods and do strength training.';

  @override
  String get normalSuggestion =>
      'Great! Maintain your weight with a balanced diet and regular activity.';

  @override
  String get overweightSuggestion =>
      'You are overweight. Try a low-calorie diet and increase physical activity.';

  @override
  String get obeseSuggestion =>
      'You are obese. Consult a doctor and follow a structured health plan.';
}
