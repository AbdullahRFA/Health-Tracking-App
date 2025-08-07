# BMI Calculator App

A Flutter-based mobile application for calculating Body Mass Index (BMI) with support for multiple languages.

## Features

- Calculate BMI based on height, weight, age, and gender
- Beautiful gradient UI with smooth animations
- Multi-language support (English and Bengali)
- BMI category classification with health advice
- Responsive design that works on various screen sizes
- Material Design components and theming

## Screenshots

(Add screenshots of your app here)

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- An IDE (Android Studio, VS Code, etc.)
- A device or emulator to run the app

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/health_tracking_app.git
   ```

2. Navigate to the project directory:
   ```bash
   cd health_tracking_app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Usage

1. Select your gender (Male/Female)
2. Adjust the height slider to your height in centimeters
3. Adjust the weight slider to your weight in kilograms
4. Adjust the age slider to your age
5. Tap the "Calculate" button to see your BMI result
6. View your BMI category and health advice
7. Change language using the buttons at the bottom (English/বাংলা)

## Technical Details

- **State Management**: Uses Flutter's built-in setState for simple state management
- **Localization**: Supports English and Bengali using Flutter's localization system
- **UI Components**:
    - Custom animated gender selection buttons
    - Sliders for numeric input
    - Alert dialog for displaying results
    - Gradient background for visual appeal

## Folder Structure

```
lib/
├── l10n/          # Localization files
├── main.dart      # Main application file
```

## Dependencies

- flutter_localizations: ^[latest_version] (for localization support)

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Your Name - [@yourtwitter](https://twitter.com/yourtwitter) - your.email@example.com

Project Link: [https://github.com/yourusername/health_tracking_app](https://github.com/yourusername/health_tracking_app)

## Acknowledgments

- Flutter team for the amazing framework
- Material Design for UI inspiration
- Anyone whose code was used as inspiration