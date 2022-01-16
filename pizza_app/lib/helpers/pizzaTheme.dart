import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final PizzaTheme = () => ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.orange,
    accentColor: Colors.orangeAccent,
    backgroundColor: Colors.orangeAccent
  ).copyWith(
    secondary: Colors.yellowAccent,
  ),
  fontFamily: GoogleFonts.inter().toString(),
  textTheme: const TextTheme(
    bodyText2: TextStyle(color: Colors.blueGrey, fontSize: 36),
    headline1: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
        letterSpacing: 1
    ),
    headline3: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.blueGrey,
        letterSpacing: 1
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.redAccent,
    actionTextColor: Colors.black87,
    contentTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.white70,
        letterSpacing: 1
    ),
  ),
);