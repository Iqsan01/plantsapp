import 'package:flutter/material.dart';
import 'package:plantapps/widget/category_list.dart';
import 'package:plantapps/widget/content_list.dart';
import 'package:plantapps/screen/category_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                                    "PlantApps",
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
                          Expanded(
                              flex: 2,
                              child: Image.asset(
                                "assets/images/img_logo.png",
                                width: 66,
                              ))
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
          Padding(
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoryScreen(
                              category: "medicine",
                            ))),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Image.asset("assets/images/img_herb.png",
                                width: 47),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Tanaman Obat",
                              style: TextStyle(
                                  fontFamily: "Noto",
                                  fontStyle: FontStyle.italic,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 8,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoryScreen(
                              category: "fruit",
                            ))),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Image.asset("assets/images/img_fruit.png",
                                width: 47),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Buah-Buahan",
                              style: TextStyle(
                                  fontFamily: "Noto",
                                  fontStyle: FontStyle.italic,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 8,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoryScreen(
                              category: "herbs",
                            ))),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Image.asset("assets/images/img_spice.png",
                                width: 47),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Rempah",
                              style: TextStyle(
                                  fontFamily: "Noto",
                                  fontStyle: FontStyle.italic,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 8,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Terkini",
                  style: TextStyle(
                      fontFamily: "Noto",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF36455A),
                      decoration: TextDecoration.none),
                )
              ],
            ),
          ),
          Flexible(
            child: ContentList(
              categories: "all",
            ),
          ),
        ],
      ),
    );
  }
}
