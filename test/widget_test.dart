// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kimyapar/main.dart';
import 'package:kimyapar/models/UserModel.dart';
import 'package:kimyapar/services/getUser.dart';

 main()  {
  
  test("GetUsers",()async{
   final service = UserHelper();
   final response = await service.retrieveUsers();
   expect(response is List<UserModel>, true) ;
  });
}
