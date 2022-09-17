import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String? createdUser;
  Timestamp? createdOn;
  String? receivedUser;
  String? desc;
  bool? status;
  String? receivedUrl;

  OrderModel();

  Map<String, dynamic> toMap() {
    return {
      'createdUser': createdUser,
      'receivedUser': receivedUser,
      'desc': desc,
      'status': status,
      'receivedUrl': receivedUrl,
      'createdOn': createdOn
    };
  }

  OrderModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : createdUser = doc.data()!["createdUser"],
        receivedUser = doc.data()!["receivedUser"],
        desc = doc.data()!["desc"],
        status = doc.data()!["status"],
        receivedUrl = doc.data()!["receivedUrl"],
        createdOn = doc.data()!["createdOn"];
}
