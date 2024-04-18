import 'package:cloud_firestore/cloud_firestore.dart';

class firebase {
  // get data from fire store as snapshot

  static Stream<QuerySnapshot> getSnapShot(String collection) {
    return FirebaseFirestore.instance.collection(collection).snapshots();
  }

  // get a data from sub collection as snapshot
  static Stream<QuerySnapshot> getSubCollectionSnapShot(
      String collection, String docId, String subCollection) {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(docId)
        .collection(subCollection)
        .snapshots();
  }
}
