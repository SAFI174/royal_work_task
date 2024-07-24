import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> getUserInfo();

  Stream<User?> get checkAuthStatus;
  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<void> getAndCreateUser({
    required UserModel user,
  });
  Future<void> signOut();
}
