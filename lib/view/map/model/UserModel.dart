import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String ? email;
 
  String? imageUrl;
  String? name;
 
  UserModel();

  Map<String, dynamic> toMap() {
    return {'name': name,   'imageUrl': imageUrl,'id':id,'email':email};
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : name = doc.data()!["name"],
     
        imageUrl = doc.data()!["imageUrl"],
        id = doc.data()!["id"],
    
        email = doc.data()!["email"];

}
