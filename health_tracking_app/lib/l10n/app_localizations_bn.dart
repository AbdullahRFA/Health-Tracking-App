// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'বিএমআই ক্যালকুলেটর';

  @override
  String get enterDetails => 'আপনার তথ্য দিন';

  @override
  String get calculate => 'হিসাব করুন';

  @override
  String get male => 'পুরুষ';

  @override
  String get female => 'নারী';

  @override
  String get height => 'উচ্চতা';

  @override
  String get weight => 'ওজন';

  @override
  String get age => 'বয়স';

  @override
  String get bmiResult => 'বিএমআই ফলাফল';

  @override
  String get category => 'বিভাগ';

  @override
  String get close => 'বন্ধ করুন';

  @override
  String get underweight => 'কম ওজন';

  @override
  String get normal => 'স্বাভাবিক';

  @override
  String get overweight => 'অতিরিক্ত ওজন';

  @override
  String get obese => 'মোটা';

  @override
  String get underweightSuggestion =>
      'আপনার ওজন কম। বেশি ক্যালোরিযুক্ত খাবার খান এবং শক্তি প্রশিক্ষণ করুন।';

  @override
  String get normalSuggestion =>
      'চমৎকার! সুষম খাদ্য ও নিয়মিত ব্যায়ামে ওজন বজায় রাখুন।';

  @override
  String get overweightSuggestion =>
      'আপনার ওজন বেশি। কম ক্যালোরিযুক্ত খাদ্য গ্রহণ করুন এবং ব্যায়াম করুন।';

  @override
  String get obeseSuggestion =>
      'আপনি মোটা। একজন চিকিৎসকের পরামর্শ নিন এবং স্বাস্থ্য পরিকল্পনা অনুসরণ করুন।';
}
