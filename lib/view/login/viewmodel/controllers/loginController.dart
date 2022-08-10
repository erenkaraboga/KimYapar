import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/view/login/service/ILoginService.dart';
import 'package:kimyapar/view/map/viewmodel/controllers/mapController.dart';

class LoginController extends GetxController {
  final ILoginService loginService;
  final mapController = Get.find<MapController>();
  LoginController(this.loginService);
  late Rx<User?> firebaseAuthUser;
  var isLoading = true.obs;
  @override
  void onReady() {
    super.onReady();
   
    firebaseAuthUser = Rx<User?>(loginService.auth.currentUser);
    firebaseAuthUser.bindStream(loginService.auth.userChanges());
  
    ever(firebaseAuthUser, _setInitialScreen);
  }
  _setInitialScreen(User? user) async {
    if (user == null) {
      Get.offNamed("/signIn");
    } else {
       getCurrentUser();
      changeLoading();
      loggedSnackBar();
      await Future.delayed(const Duration(seconds: 2));
      Get.toNamed("/map");
    }
  }

  void register(String email, password) async {
    try {
      var user = await loginService.register(email, password);
      if (user != null) {
        String id = user.uid;
        mapController.mapService.db.collection('users').doc(id).set({
          'id': id,
          'name': email,
          'lat': mapController.position.value.latitude,
          'long': mapController.position.value.longitude
        });
      }
    } catch (firebaseAuthException) {}
  }
  void getCurrentUser()async{
   print(firebaseAuthUser.value!.uid);
   FirebaseFirestore.instance
    .collection('users')
    .doc(firebaseAuthUser.value!.uid)
    .get()
    .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void login(String email, password) async {
    try {
      loginService.login(email, password);
    } catch (firebaseAuthException) {}
  }

  void signOut() async {
    loginService.logOut();
    changeLoading();
  }

  void changeLoading() {
    isLoading.value = !isLoading.value;
  }

  void loggedSnackBar() {
    Get.snackbar(
      "Hoşgeldiniz",
      "Hello everyone",
      icon: const Icon(Icons.person, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orangeAccent,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
