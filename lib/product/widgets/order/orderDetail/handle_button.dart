import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/product/widgets/order/orderDetail/handle_button_complate.dart';
import 'package:kimyapar/product/widgets/order/orderDetail/handle_button_prepare.dart';
import 'package:kimyapar/product/widgets/order/orderDetail/handle_button_road.dart';
import 'package:kimyapar/product/widgets/order/orderDetail/handle_button_take.dart';

import '../../../../view/user_order/viewmodel/controllers/controller.dart';

class IHandleButton extends StatelessWidget {
  const IHandleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Obx(() => Stack(
            children: [
              const Divider(
                thickness: 1,
              ),
              take(),
              preapare(),
              road(),
              complate()
            ],
          )),
    );
  }
}
