
import '../../view/map/model/UserModel.dart';
abstract class IFirebaseService{
  Future<List<UserModel>> getAllUsers();
  void getCurrentUser();

}