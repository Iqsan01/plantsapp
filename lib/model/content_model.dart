import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _contentCollection =
    _firestore.collection('plantapps');

class Content {
  // static String? title;
  // static String? category;
  // static String? content;
  // static String? images;
  // static String? createAt;

  static String? userUid;

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection = _contentCollection;

    return notesItemCollection.snapshots();
  }
}
