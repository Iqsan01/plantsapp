import 'package:flutter/material.dart';
import 'package:plantapps/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlantApps',
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage(),
    );
  }
}
