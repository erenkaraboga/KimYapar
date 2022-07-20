import 'package:flutter/material.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({Key? key, required this.path}) : super(key: key);
  final String path;
  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  static double  height = 130;
  static double  width = 130;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        child: ClipOval(child: Image.asset(widget.path)),
        elevation: 5,
        shape: CircleBorder(),
        margin: EdgeInsets.all(
          19,
        ),
      ),
    );
  }
}