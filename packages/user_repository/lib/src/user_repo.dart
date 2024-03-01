import 'package:firebase_auth/firebase_auth.dart';
import 'models/model.dart';

abstract class UserRepository {
  Stream<User?> get user;

  // Authentication by Email and password

  Future<UserModel> signUpByEmail(UserModel myUser, String password);

  Future<void> setUserData(UserModel myUser);

  Future<void> signInByEmail(String email, String password);

  Future<void> logOut();

  Future<void> resetPassword(String email);
}
