import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plantapps/model/content_model.dart';
import 'package:plantapps/screen/detail_screen.dart';

class ContentList extends StatelessWidget {
  final String categories;

  ContentList({required this.categories});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Content.readItems(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          print("Item Count " + (snapshot.data?.docs.length).toString());
          if (snapshot.data!.docs.length <= 0) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.green,
                ),
              ),
            );
          } else {
            return ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              separatorBuilder: (context, index) => SizedBox(height: 4.0),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var noteInfo = snapshot.data!.docs[index].data()!;
                String docID = snapshot.data!.docs[index].id;
                String title = (snapshot.data!.docs[index].data()!
                    as Map<String, dynamic>)['title'];
                String content = (snapshot.data!.docs[index].data()!
                    as Map<String, dynamic>)['content'];
                String img = (snapshot.data!.docs[index].data()!
                    as Map<String, dynamic>)['images'];
                String category = (snapshot.data!.docs[index].data()!
                    as Map<String, dynamic>)['category'];
                print("This Is Our Data $title and $img");
                if (categories == category) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailScreen(
                              title: title,
                              content: content,
                              img: img,
                              category: category,
                            ))),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(24.0, 4.0, 24.0, 4.0),
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Stack(
                          children: [
                            ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                Colors.grey,
                                BlendMode.darken,
                              ),
                              child: img.contains("data:image")
                                  ? Image.memory(
                                      base64Decode(img.split(',')[1]),
                                      height: 200.0,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    )
                                  : Image(
                                      image: NetworkImage(img),
                                      height: 200.0,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 14.0,
                                bottom: 14.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 140,
                                  ),
                                  Text(
                                    title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Noto",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    content,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Noto",
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (categories == 'all') {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailScreen(
                              title: title,
                              content: content,
                              img: img,
                              category: category,
                            ))),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(24.0, 4.0, 24.0, 4.0),
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Stack(
                          children: [
                            ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                Colors.grey,
                                BlendMode.darken,
                              ),
                              child: Image(
                                image: NetworkImage(img),
                                height: 200.0,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 14.0,
                                bottom: 14.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 140,
                                  ),
                                  Text(
                                    title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Noto",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    content,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Noto",
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            );
          }
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.green,
            ),
          ),
        );
      },
    );
  }
}
