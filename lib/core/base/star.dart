
import 'package:flutter/material.dart';
class StarWidget extends StatelessWidget {
  final int total;
  final int activated;

  const StarWidget({Key? key, this.total = 5, required this.activated})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(total, (index) {
        var filled = index < activated;
        return Icon(filled ? Icons.star : Icons.star_border);
      }).toList(),
    );
  }
}
StarWidget calculateStar(double rate) {
  if (rate > 0.0 && rate < 1.2) {
    return StarWidget(activated: 1);
  } else if (rate > 1.0 && rate < 2.1) {
    return StarWidget(activated: 2);
  } else if (rate > 2.0 && rate < 3.1) {
    return StarWidget(activated: 3);
  } else if (rate > 3.0 && rate < 4.1) {
    return StarWidget(activated: 4);
  } else {
    return StarWidget(activated: 5);
  }
}