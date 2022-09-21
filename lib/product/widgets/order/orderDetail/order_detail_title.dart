import "package:flutter/material.dart";

import '../../../../view/user_order/model/orderInfo.dart';

class OrderTitle extends StatelessWidget {
  const OrderTitle({
    Key? key,
    required this.orderInfo,
  }) : super(key: key);

  final OrderInfo orderInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Yeni Sipariş",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          '${orderInfo.date.day}/${orderInfo.date.month}/${orderInfo.date.year}',
          style: const TextStyle(
            color: Color(0xffb6b2b2),
          ),
        ),
      ],
    );
  }
}
