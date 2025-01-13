import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  // Access the screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  // Access the screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  // Access the primary color from the theme
  Color get primaryColor => Theme.of(this).primaryColor;

  // Access the text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  // Show a snackbar
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

}

