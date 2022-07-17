import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
   String? name;
   double? lat;
   double? long;
  UserModel(){}

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lat': lat,
      'long': long,
    };
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : name = doc.data()!["name"],
        lat = doc.data()!["lat"],
        long = doc.data()!["long"];
}
