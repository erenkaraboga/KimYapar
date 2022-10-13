import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/responsive.dart';
import '../../../core/constants/styles/container.dart';
import '../../../core/constants/styles/text.dart';
import '../../../view/user_order/model/ordermodel.dart';

orderStatus(BuildContext context, OrderModel model) {
  return Container(
    decoration: orderStatusBox(),
    height: 27,
    width: Responsive.isTablet(context) ? 180 : 160,
    child: Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 6),
        child: Text(
          "Max 40 TL",
          style: ksmallTextStyle(),
        )),
  );
}


