import 'package:flutter/material.dart';
import 'package:plantapps/screen/home_screen.dart';
import 'package:plantapps/widget/category_list.dart';
import 'package:plantapps/widget/content_list.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  CategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset("assets/images/img_bg.png"),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen())),
                child: Padding(
                  padding: EdgeInsets.only(left: 24.0, top: 48.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 72.0, 24.0, 24.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 8,
                            child: SafeArea(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (category == "medicine")
                                        ? "Tanaman Obat"
                                        : (category == "fruit")
                                            ? "Buah-Buahan"
                                            : "Rempah-Rempah",
                                    style: TextStyle(
                                      fontFamily: "Noto",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 21,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  Text(
                                    "Selamat datang, ayo belajar tanaman!",
                                    style: TextStyle(
                                      fontFamily: "Noto",
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                      fontSize: 14,
                                      decoration: TextDecoration.none,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 14.0,
                      ),
                      Card(
                        color: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(64))),
                        child: Container(
                          child: TextField(
                              style: TextStyle(
                                  color: Colors.green, fontFamily: "Noto"),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(64)),
                                      borderSide: BorderSide.none),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  fillColor: Colors.white,
                                  hintText: 'Cari Sesuatu...',
                                  filled: true)),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          Expanded(
            child: ContentList(
              categories: category,
            ),
          ),
        ],
      ),
    );
  }
}
