import 'package:flutter/material.dart';
import 'package:kimyapar/core/base/avatar.dart';

class MyWidget extends StatelessWidget {
  MyWidget({Key? key, required this.name, required this.url}) : super(key: key);
  String name;
  String url;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(name),
      leading: ClipOval(
        child: Image.network(
          url,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
