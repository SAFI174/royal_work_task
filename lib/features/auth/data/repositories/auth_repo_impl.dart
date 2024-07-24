import 'package:dartz/dartz.dart';
import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:royal_task/core/common/entites/user.dart';
import 'package:royal_task/features/auth/domain/repositories/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRepoImpl({required AuthRemoteDatasource authRemoteDatasource})
      : _authRemoteDatasource = authRemoteDatasource;

  @override
  Future<Either<Failure, User>> getUserInfo() async {
    try {
      final user = await _authRemoteDatasource.getUserInfo();
      return right(user);
    } on ServerFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(
          ServerFailure(message: 'Failed to get user: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authRemoteDatasource.signIn(
        email: email,
        password: password,
      );
      return right(user);
    } on ServerFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(ServerFailure(message: 'Failed to sign in: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _authRemoteDatasource.signOut();
      return right(null);
    } on ServerFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(
          ServerFailure(message: 'Failed to sign out: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, User>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authRemoteDatasource.signUp(
        name: name,
        email: email,
        password: password,
      );
      return right(user);
    } on ServerFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(ServerFailure(message: 'Failed to sign up: ${e.toString()}'));
    }
  }

  @override
  // TODO: implement checkAuthStatus
  Stream<fa.User?> get checkAuthStatus => _authRemoteDatasource.checkAuthStatus;
}
