import 'package:dartz/dartz.dart';
import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/core/usecase/usecase.dart';
import 'package:royal_task/core/common/entites/user.dart';

import '../repositories/auth_repo.dart';

class SignInUsecase implements Usecase<User, SignInParams> {
  final AuthRepo _authRepo;

  SignInUsecase(this._authRepo);
  @override
  Future<Either<Failure, User>> call(SignInParams params) {
    return _authRepo.signIn(email: params.email, password: params.password);
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});
}
