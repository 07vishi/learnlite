import 'package:flutter/material.dart';
import 'pages/splash_page.dart'; // Import splash page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      home: SplashPage(), // Show splash page first
      debugShowCheckedModeBanner: false,
    );
  }
}
