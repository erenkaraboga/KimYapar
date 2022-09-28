  import 'dart:ffi';

import 'package:flutter/material.dart';
  TextButton cancelButton(VoidCallback cancel) {
    return TextButton(
      onPressed: cancel,
      child: const Text(
        'Geri',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }