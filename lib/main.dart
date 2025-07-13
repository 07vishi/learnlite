import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/splash_page.dart'; // Import splash page
import 'package:flutter/foundation.dart'; // for kIsWeb

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyATn2e1O7LKiE-0eIrAKyD2j4G55sBH0-o",
        authDomain: "learn-lite-7a2f1.firebaseapp.com",
        projectId: "learn-lite-7a2f1",
        storageBucket: "learn-lite-7a2f1.appspot.com",
        messagingSenderId: "300672508960",
        appId: "1:300672508960:web:0397c8ca114ebab65cc845",
        measurementId: "G-LQ043CGHPV",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

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
