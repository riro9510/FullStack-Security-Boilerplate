import 'package:flutter/material.dart';

class CustomThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF6200EE),
    scaffoldBackgroundColor: Color(0xFFF5F5F5),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF212121)),
      bodyMedium: TextStyle(color: Color(0xFF757575)),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFFFFFFF),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF212121)),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFF6200EE),
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF212121),
    ), colorScheme: ColorScheme.light(
      primary: Color(0xFF6200EE),
      secondary: Color(0xFF03DAC6),
      surface: Color(0xFFF5F5F5),
      onSurface: Color(0xFF212121),
      onPrimary: Colors.white,
      onSecondary: Color(0xFF212121),
    ).copyWith(surface: Color(0xFFFFFFFF)),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFFBB86FC),
    scaffoldBackgroundColor: Color(0xFF333333),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFE0E0E0)),
      bodyMedium: TextStyle(color: Color(0xFFB0B0B0)),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF121212),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFFE0E0E0)),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFFBB86FC),
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: IconThemeData(
      color: Color(0xFFE0E0E0),
    ), colorScheme: ColorScheme.dark(
      primary: Color(0xFFBB86FC),
      secondary: Color(0xFF03DAC6),
      surface: Color(0xFF333333),
      onSurface: Color(0xFFE0E0E0),
      onPrimary: Colors.black,
      onSecondary: Color(0xFFE0E0E0),
    ).copyWith(surface: Color(0xFF121212)),
  );
}
