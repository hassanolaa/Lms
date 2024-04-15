import 'package:cloud_firestore/cloud_firestore.dart';

class firebase {
  // get data from fire store as snapshot

  static Stream<QuerySnapshot> getSnapShot(String collection) {
    return FirebaseFirestore.instance.collection(collection).snapshots();
  }
}
