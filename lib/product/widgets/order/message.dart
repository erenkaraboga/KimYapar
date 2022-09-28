import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:kimyapar/view/chats/viewmodel/controller/chatcontroller.dart';
import 'package:kimyapar/view/map/viewmodel/controllers/mapController.dart';

import '../../../view/map/model/UserModel.dart';
import '../../../view/user_order/model/ordermodel.dart';
import '../../../view/user_order/view/chef/chefOrders.dart';



messageBox(OrderModel orderModel, UserModel model) {
  return GestureDetector(
    onTap: () => chatController.sendMessage(model),
    child: Visibility(
      visible: orderModel.receivedUser != "" ? true : false,
      child: const Icon(
        Icons.message,
        color: CupertinoColors.activeGreen,
      ),
    ),
  );
}
messageBoxChef(OrderModel orderModel, UserModel model) {
  return GestureDetector(
    onTap: () => chatController.sendMessage(model),
    child: const Icon(
      Icons.message,
      color: CupertinoColors.activeGreen,
    ),
  );
}


