import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String ? email;
 
  String? imageUrl;
  String? name;
  double? lat;
  double? long;
  UserModel();

  Map<String, dynamic> toMap() {
    return {'name': name, 'lat': lat, 'long': long, 'imageUrl': imageUrl,'id':id,'email':email};
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : name = doc.data()!["name"],
        lat = doc.data()!["lat"],
        long = doc.data()!["long"],
        imageUrl = doc.data()!["imageUrl"],
        id = doc.data()!["id"],
    
        email = doc.data()!["email"];

}
