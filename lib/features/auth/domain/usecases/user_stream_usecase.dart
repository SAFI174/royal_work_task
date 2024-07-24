import 'package:firebase_auth/firebase_auth.dart';
import 'package:royal_task/features/auth/domain/repositories/auth_repo.dart';

class UserStreamUsecase {
  final AuthRepo _authRepo;

  UserStreamUsecase(AuthRepo authRepo) : _authRepo = authRepo;
  Stream<User?> call() {
    return _authRepo.checkAuthStatus;
  }
}
