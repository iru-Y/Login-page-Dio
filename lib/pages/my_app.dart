import 'package:flutter/material.dart';
import 'login_page.dart';

class MyApp extends StatefulWidget {


 const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeData theme = new ThemeData();

  final MaterialColor bodyColor = const MaterialColor(
    0xFF15161B,
    <int, Color>{
      50: Color(0xFF15161B),
    },
  );

  final MaterialColor purpleCustomColor = const MaterialColor(
    0xFF932ED1,
    <int, Color>{
      50: Color(0xFFF4E6FA),
      100: Color(0xFFE7B3F1),
      200: Color(0xFFD780E8),
      300: Color(0xFFC64DDE),
      400: Color(0xFFB41FD4),
      500: Color(0xFF932ED1),
      600: Color(0xFF8629B8),
      700: Color(0xFF7824A2),
      800: Color(0xFF6A1D8C),
      900: Color(0xFF5B1574),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
          primary: purpleCustomColor,
          secondary: Colors.white,
          background: bodyColor,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Colors.white),
          displayMedium: TextStyle(color: Colors.white),
          displaySmall: TextStyle(color: Colors.white),
          titleMedium: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const LoginPage(),
    );
  }
}