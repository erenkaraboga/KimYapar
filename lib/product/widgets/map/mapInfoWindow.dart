import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key, required this.name, required this.url})
      : super(key: key);
  final String name;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  topLeft: Radius.circular(30))),
          child: ListTile(
            dense: true,
            contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
            title: Text(name),
            trailing: const Icon(Icons.chevron_right),
            leading: ClipOval(
              child: Image.network(
                url,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          )),
    );
  }
}
