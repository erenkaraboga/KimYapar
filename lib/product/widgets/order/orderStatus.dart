  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/responsive.dart';
import '../../../core/constants/styles/container.dart';
import '../../../core/constants/styles/text.dart';
import '../../../view/order/model/OrderModel.dart';

orderStatus(BuildContext context, OrderModel model) {
    return Container(
      decoration: orderStatusBox(),
      height: 27,
      width: Responsive.isTablet(context) ? 180 : 160,
      child: Padding(
          padding: const EdgeInsets.only(left: 4.0), child: checkStatus(context ,model)),
    );
  }

  checkStatus(BuildContext context,OrderModel model) {
    if (model.status == true && model.receivedUser != '') {
      return orderStatusBuilder(
          context,
          const Icon(
            Icons.verified,
            color: CupertinoColors.activeGreen,
          ),
          "Hazırlandı");
    } else if (model.status == false && model.receivedUser != '') {
      return orderStatusBuilder(
          context,
          const Icon(
            Icons.lock_clock,
            color: Colors.redAccent,
          ),
          "Hazırlanıyor ");
    } else {
      return orderStatusBuilder(
          context,
          const Icon(
            Icons.record_voice_over,
            color: Colors.blueGrey,
          ),
          "Şef Bekleniyor");
    }
  }

  orderStatusBuilder(BuildContext context, Icon icon, String text) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 4),
        Text(
          text,
          style: ksmallTextStyle(context),
        )
      ],
    );
  }