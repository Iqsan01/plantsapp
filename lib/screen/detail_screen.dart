import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:plantapps/screen/home_screen.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String category;
  final String content;
  final String img;

  DetailScreen(
      {required this.title,
      required this.category,
      required this.content,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  img.contains('data:image')
                      ? Image.memory(
                          base64Decode(img.split(',')[1]),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 300.0,
                        )
                      : Image(
                          image: NetworkImage(img),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 300.0,
                        ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen())),
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category == "medicine"
                          ? "Obat-Obatan".toUpperCase()
                          : category == "herbs"
                              ? "Rempah-Rempah"
                              : category == "fruit"
                                  ? "Buah-Buahan"
                                  : "Berita",
                      style: TextStyle(
                          background: Paint()
                            ..color = Color(0x2F2F91EB)
                            ..strokeWidth = 12
                            ..style = PaintingStyle.stroke,
                          fontFamily: "Noto",
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color(0xFF2F91EB),
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontFamily: "Noto",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF36455A),
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      content,
                      style: TextStyle(
                          fontFamily: "Noto",
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Color(0xFF6A6F7D),
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
