import 'package:flutter/material.dart';
import 'package:plantapps/screen/login_screen.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  final _intro =
      "aplikasi PlantApps dibangun menggunakan\nframework Flutter dari Google yang\ndapat digunakan mengembangkan\nmultiplatform mobile apps";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset("assets/images/img_bg.png"),
                  Padding(
                    padding: EdgeInsets.only(top: 105.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          color: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80)),
                          child: Container(
                            child: Image.asset(
                              "assets/images/img_logo.png",
                              width: 160,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(48.0, 14.0, 48.0, 14.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "PlantApps",
                        style: TextStyle(
                          color: Color(0xFF1B8F5F),
                          fontFamily: "Noto",
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                        ),
                      ),
                      Text(
                        "belajar tanaman lebih mudah!",
                        style: TextStyle(
                          color: Color(0xFF6A6F7D),
                          fontFamily: "Noto",
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        _intro,
                        style: TextStyle(
                          color: Color(0xFF6A6F7D),
                          fontFamily: "Noto",
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 42.0,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => LoginScreen())),
                        child: Text(
                          "Administrator Access",
                          style: TextStyle(
                              color: Color(0xFF2DDA93),
                              fontFamily: "Noto",
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
