import 'package:flutter/material.dart';

class CreateTextWithIcon extends StatelessWidget {
  const CreateTextWithIcon(
      {Key? key, required this.text, required this.icon, required this.style})
      : super(key: key);
  final Icon icon;
  final String text;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class CreateText extends StatelessWidget {
  const CreateText({Key? key, required this.text, required this.style})
      : super(key: key);
  final String text;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: TextAlign.center,
    );
  }
}
