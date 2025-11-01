import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData get themeData => ThemeData(
    primaryColor: Colors.deepPurple,
    fontFamily: GoogleFonts.lato().fontFamily,
    appBarTheme: AppBarTheme(
      color: Colors.deepOrange,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.amber),
    ),
  );
}
