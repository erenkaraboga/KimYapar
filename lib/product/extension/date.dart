import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kimyapar/view/order/model/OrderModel.dart';

extension DateExtension on Timestamp {
  String toDatee(OrderModel model) {
    var date = model.createdOn!.toDate();
    return '${date.day}/${date.month} ${date.hour}:${date.minute}';
  }
}
