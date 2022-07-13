import 'package:flutter/material.dart';

class Chefs extends StatefulWidget {
  const Chefs({Key? key}) : super(key: key);

  @override
  State<Chefs> createState() => _ChefsState();
}

class _ChefsState extends State<Chefs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 20,
          shape: const CircleBorder(),
          child: SizedBox(
            height: 300,
            width: 300,
            child: Stack(
              children: [
                Positioned(
                  left: 80,
                  top: 50,
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      Text("Yeni Mah. Çankırı"),
                    ],
                  ),
                ),
                Positioned(
                  left: 80,
                  top: 100,
                  child: Row(
                    children: [
                      Icon(Icons.directions_run),
                      Text("100m İlerinizde!"),
                    ],
                  ),
                ),
                Positioned(
                  left: 120,
                  bottom: 100,
                  child: Text(
                    4.9.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.black),
                  ),
                ),
                Positioned(
                  left: 100,
                  bottom: 70,
                  child: Row(
                    children: [
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
