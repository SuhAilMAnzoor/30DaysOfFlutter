import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  // Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;

  static ThemeData lightTheme(BuildContext context) => ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: darkBluishColor,
      secondary: darkBluishColor,
      surface: Colors.white,
      background: creamColor,
    ),
    fontFamily: GoogleFonts.lato().fontFamily,
    cardColor: Colors.white,
    canvasColor: creamColor,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkBluishColor,
    ),
    useMaterial3: true,
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    colorScheme: ColorScheme.dark(
      primary: lightBluishColor,
      secondary: Colors.white,
      background: darkcreamColor,
      onSurface: darkBluishColor,
    ),
    fontFamily: GoogleFonts.lato().fontFamily,
    cardColor: Colors.black,
    canvasColor: darkcreamColor,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightBluishColor,
    ),
    textTheme: Theme.of(
      context,
    ).textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white),

    useMaterial3: true,
  );
}
