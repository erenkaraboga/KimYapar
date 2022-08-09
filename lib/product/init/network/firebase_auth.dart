import 'package:firebase_auth/firebase_auth.dart';
class FirebaseAuthInit {
  static FirebaseAuthInit? _instace;
  static FirebaseAuthInit get instance {
    _instace ??= FirebaseAuthInit.init();
    return _instace!;
  }

  late final FirebaseAuth auth;
  FirebaseAuthInit.init() {
    auth = FirebaseAuth.instance;
  }
}
