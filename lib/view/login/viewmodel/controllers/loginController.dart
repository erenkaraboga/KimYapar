import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/product/utilities/cached_image.dart';
import 'package:kimyapar/view/login/service/ILoginService.dart';

import '../../../../services/firebase/IFirebaseService.dart';
import '../../../map/model/UserModel.dart';

class LoginController extends GetxController {
  final IFirebaseService service;
  final ILoginService loginService;
  LoginController(this.service, this.loginService);
  var model = UserModel().obs;
  late Rx<User?> firebaseAuthUser;
  var isLoading = true.obs;
  @override
  void onReady() {
    super.onReady();

    firebaseAuthUser = Rx<User?>(service.auth.currentUser);
    firebaseAuthUser.bindStream(service.auth.userChanges());

    ever(firebaseAuthUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    if (user == null) {
      Get.offNamed("/signIn");
    } else {
      await getCurrentUser();
      changeLoading();
      loggedSnackBar();
      await Future.delayed(const Duration(seconds: 2));
      Get.offNamed("/map");
    }
  }

  void register(String email, password) async {
    loginService.registerUser(email, password);
  }

  getCurrentUser() async {
    model.value = await service.getCurrentUser((service.auth.currentUser!.uid));
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

  void verify(String number) {
    loginService.verifyNumber(number);
  }

  void loggedSnackBar() {
    Get.snackbar(
      model.value.name ?? "null",
      "Hoşgeldiniz",
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipOval(
            child: Material(
          child: cachedImage(model.value.imageUrl ??
              "https://images.assetsdelivery.com/compings_v2/tuktukdesign/tuktukdesign1606/tuktukdesign160600119.jpg"),
        )),
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orangeAccent,
      borderRadius: 10,
      padding: const EdgeInsets.all(20),
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.all(10),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
    );
  }
}
