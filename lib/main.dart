import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/splash_page.dart'; // Import splash page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
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
