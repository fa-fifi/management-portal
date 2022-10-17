import 'package:flutter/material.dart';

final theme = ThemeData(
  primarySwatch: Colors.teal,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.grey.shade200,
    filled: true,
    floatingLabelStyle: const TextStyle(color: Colors.black),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black12, width: 1.5),
      borderRadius: BorderRadius.circular(25),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black12),
      borderRadius: BorderRadius.circular(25),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(25),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 1.5),
      borderRadius: BorderRadius.circular(25),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
      minimumSize: const Size(250, 50),
    ),
  ),
);
