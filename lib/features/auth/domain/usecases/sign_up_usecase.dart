import 'package:dartz/dartz.dart';
import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/core/usecase/usecase.dart';
import 'package:royal_task/core/common/entites/user.dart';

import '../repositories/auth_repo.dart';

class SignUpUsecase implements Usecase<User, SignUpParams> {
  final AuthRepo _authRepo;

  SignUpUsecase(this._authRepo);
  @override
  Future<Either<Failure, User>> call(SignUpParams params) {
    return _authRepo.signUp(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String name;
  final String email;
  final String password;

  SignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
