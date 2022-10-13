import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kimyapar/view/add_order/model/add_order_model.dart';

import 'IOrderService.dart';

class OrderService extends IOrderService {
  OrderService(super.service);

  CollectionReference<Map<String, dynamic>> getOrderRequest() {
    return super.service.db.collection("orders");
  }

  @override
  void addOrder(AddOrderModel model) async{
   var response =  await getOrderRequest().add({
      'createdOn': FieldValue.serverTimestamp(),
      'createdUser': super.service.auth.currentUser!.uid,
      'desc': model.desc,
      'receivedUser': "",
      'status': 0,
      'adress': model.adress,
      'title':model.title
    });
   
  }

  @override
  getMyOrders() {
    var response = getOrderRequest()
        .where('createdUser', isEqualTo: super.service.auth.currentUser!.uid)
        .snapshots();

    return response;
  }

  @override
  getCurrentOrderedUser(String id) {
    return service.db
        .collection('users')
        .where('id', isEqualTo: id)
        .snapshots();
  }

  @override
  getNotTakenOrders() {
    return getOrderRequest()
        .where("createdUser", isNotEqualTo: super.service.auth.currentUser!.uid)
        .where("receivedUser",
            whereIn: ["", super.service.auth.currentUser!.uid]).snapshots();
  }

  @override
  takeOrder(String docId) {
    getOrderRequest().doc(docId).update(
        {'receivedUser': super.service.auth.currentUser!.uid, 'status': 1});
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getCurrentOrder(String docId) {
    return getOrderRequest().doc(docId).snapshots();
  }

  @override
  finishOrder(String docId, String qr) {
    if (docId == qr) {
     completeOrder(docId);
      return true;
    } else {
      return false;
    }
  }
  
  @override
  void roadOrder(String docId) {
    getOrderRequest().doc(docId).update(
        {'status': 2});
  }
  
  @override
  void qrStatus(String docId) {
     getOrderRequest().doc(docId).update(
        {'status': 3});
  }
  
  @override
  void completeOrder(String docId) {
    getOrderRequest().doc(docId).update(
        {'status': 4});
  }
}
