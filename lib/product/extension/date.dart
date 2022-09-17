import 'package:cloud_firestore/cloud_firestore.dart';




import '../../view/user_order/model/ordermodel.dart';

extension DateExtension on Timestamp {
  String toDatee(OrderModel model) {
    var date = model.createdOn!.toDate();
    return '${date.day}/${date.month} ${date.hour}:${date.minute}';
  }
}
