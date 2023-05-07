import 'package:flutter/material.dart';
import 'package:plantapps/widget/admin_content_list.dart';
import 'package:plantapps/widget/category_list.dart';
import 'package:plantapps/widget/content_list.dart';
import 'package:plantapps/screen/category_screen.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
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
                                  "Halo Admin",
                                  style: TextStyle(
                                    fontFamily: "Noto",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 21,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  "Selamat datang di PlantApps!",
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
                          borderRadius: BorderRadius.all(Radius.circular(64))),
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
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Semua",
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
            child: AdminContentList(
              categories: "all",
            ),
          ),
        ],
      ),
    );
  }
}
