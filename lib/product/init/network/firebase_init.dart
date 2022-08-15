import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseInit {
  static FirebaseInit? _instace;
  static FirebaseInit get instance {
    _instace ??= FirebaseInit.init();
    return _instace!;
  }

  late final FirebaseFirestore db;
  FirebaseInit.init() {
    db = FirebaseFirestore.instance;
  }
}
