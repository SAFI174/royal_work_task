import 'package:dartz/dartz.dart';
import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/core/common/entites/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;

abstract class AuthRepo {
  Stream<fa.User?> get checkAuthStatus;
  Future<Either<Failure, User>> getUserInfo();

  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> signOut();
}
