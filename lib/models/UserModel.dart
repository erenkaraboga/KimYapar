import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final double lat;
  final double long;

  UserModel({
    required this.name,
    required this.lat,
    required this.long,
  });

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
