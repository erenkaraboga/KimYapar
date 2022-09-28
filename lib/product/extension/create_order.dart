
import '../../view/user_order/model/ordermodel.dart';

extension DateExtension on String {
  String toOrder(OrderModel model) {
    var date = model.createdOn!.toDate();
    return '${date.day}/${date.month} ${date.hour}:${date.minute}';
  }
}
