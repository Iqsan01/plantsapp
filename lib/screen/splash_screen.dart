import 'dart:async';
import 'package:flutter/material.dart';
import 'package:plantapps/screen/onboarding_screen.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({ Key? key }) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return OnboardingScreen();
        }),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Colors.white,
      body : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Center(
              child: Image.asset(
                "assets/images/logo_main.png",
                width: 200.0,
                height: 200.0,
              ),
            ),
            Center(
              child: Text(
                "PlantApps", 
                style: TextStyle(
                  fontSize: 36.0,
                  fontFamily: 'Noto',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B8F5F)
                ),
              ),
            ),
            Center(
              child: Text(
                "belajar tanaman lebih mudah", 
                style: TextStyle(
                  fontSize: 13.0,
                  fontFamily: 'Noto',
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF6A6F7D)
                ),
              ),
            ),
        ],          
      ),
    );
  }
}