import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String? createdUser;
  Timestamp? createdOn;
  String? receivedUser;
  String? adress;
  String? desc;
  String? title;
  int? status;
  String? receivedUrl;
  bool? completed;

  OrderModel();

  Map<String, dynamic> toMap() {
    return {
      'completed': completed,
      'createdUser': createdUser,
      'receivedUser': receivedUser,
      'title': title,
      'status': status,
      'receivedUrl': receivedUrl,
      'createdOn': createdOn,
      'adress': adress,
      'desc': desc
    };
  }

  OrderModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : createdUser = doc.data()!["createdUser"],
        receivedUser = doc.data()!["receivedUser"],
        title = doc.data()!["title"],
        status = doc.data()!["status"],
        receivedUrl = doc.data()!["receivedUrl"],
        createdOn = doc.data()!["createdOn"],
        desc = doc.data()!["desc"],
        adress = doc.data()!["adress"],
        completed = doc.data()!["completed"];
}
