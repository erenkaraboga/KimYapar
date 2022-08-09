import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kimyapar/view/login/service/ILoginService.dart';
import 'package:kimyapar/view/login/view/SignIn.dart';

import '../../../map/view/mapPage.dart';

class LoginController extends GetxController {
  final ILoginService loginService;
  LoginController(this.loginService);
  late Rx<User?> firebaseUser;
  var isLoading = true.obs;
  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there
    firebaseUser = Rx<User?>(loginService.auth.currentUser);
    firebaseUser.bindStream(loginService.auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async{
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offNamed("/signIn");
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
   
      changeLoading();
        await Future.delayed(const Duration(seconds:2));
      Get.toNamed("/map");
    }
  }

  void register(String email, password) async {
    try {
      loginService.auth
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (firebaseAuthException) {}
  }

  void login(String email, password) async {
    try {
      loginService.auth
          .signInWithEmailAndPassword(email: email, password: password);
      
    } catch (firebaseAuthException) {}
  }

  void signOut() async {
    loginService.auth.signOut();
    changeLoading();
  }

  void changeLoading() {
    isLoading.value = !isLoading.value;
  }
}
