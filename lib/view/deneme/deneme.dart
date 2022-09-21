import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _isButtonDisabled =  false;
  var _isButtonDisabled2 = false;
  var _isButtonDisabled3 = false;
  var _isButtonDisabled4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Container(
        margin: const EdgeInsets.only(top: 20),
        child: ChoiceChip(
          labelStyle: const TextStyle(color: Colors.white),
          label: const Text(
            "Ben Yaparım",
            style: TextStyle(color: Colors.white),
          ),
          selected: false,
          avatar: _isButtonDisabled
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : null,
          onSelected: _isButtonDisabled
              ? null
              : (bool selected) {
                  setState(() {
                    _isButtonDisabled = true;
                    print("Sipariş Seçildi");
                  });
                },
          //Do whatever you want when the chip is selected

          disabledColor: CupertinoColors.activeGreen,
          backgroundColor: AppColors.primary,
          elevation: 15,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 20),
        child: ChoiceChip(
          labelStyle: const TextStyle(color: Colors.white),
          label: const Text(
            "Hazırlıyorum",
            style: TextStyle(color: Colors.white),
          ),
          selected: false,
          avatar: _isButtonDisabled
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : null,
          onSelected: _isButtonDisabled
              ? null
              : (bool selected) {
                  setState(() {
                    _isButtonDisabled = true;
                    print("Sipariş Seçildi");
                  });
                },
          //Do whatever you want when the chip is selected

          disabledColor: CupertinoColors.activeGreen,
          backgroundColor: AppColors.primary,
          elevation: 15,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 20),
        child: ChoiceChip(
          labelStyle: const TextStyle(color: Colors.white),
          label: const Text(
            "Yoldayım",
            style: TextStyle(color: Colors.white),
          ),
          selected: false,
          avatar: _isButtonDisabled
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : null,
          onSelected: _isButtonDisabled
              ? null
              : (bool selected) {
                  setState(() {
                    _isButtonDisabled = true;
                    print("Sipariş Seçildi");
                  });
                },
          //Do whatever you want when the chip is selected

          disabledColor: CupertinoColors.activeGreen,
          backgroundColor: AppColors.primary,
          elevation: 15,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 20),
        child: ChoiceChip(
          labelStyle: const TextStyle(color: Colors.white),
          label: const Text(
            "Teslim",
            style: TextStyle(color: Colors.white),
          ),
          selected: false,
          avatar: _isButtonDisabled
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : null,
          onSelected: _isButtonDisabled
              ? null
              : (bool selected) {
                  setState(() {
                    _isButtonDisabled = true;
                    print("Sipariş Seçildi");
                  });
                },
          //Do whatever you want when the chip is selected

          disabledColor: CupertinoColors.activeGreen,
          backgroundColor: AppColors.primary,
          elevation: 15,
        ),
      ),
        ],
      ),
    );
  }
}
