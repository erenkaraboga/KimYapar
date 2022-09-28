import 'package:flutter/material.dart';

Padding continueButton(VoidCallback continued) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      onPressed: continued,
      style: const ButtonStyle(),
      child: const Text('Seç'),
    ),
  );
}
