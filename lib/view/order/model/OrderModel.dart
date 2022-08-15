import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String? createdUser;
  String? receivedUser;
  String? desc;

  OrderModel();

  Map<String, dynamic> toMap() {
    return {
      'createdUser': createdUser,
      'receivedUser': receivedUser,
      'desc': desc,
    };
  }

  OrderModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : createdUser = doc.data()!["createdUser"],
        receivedUser = doc.data()!["receivedUser"],
        desc = doc.data()!["desc"];
}
