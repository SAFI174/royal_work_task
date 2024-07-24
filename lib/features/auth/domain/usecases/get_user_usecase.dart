import 'package:dartz/dartz.dart';
import 'package:royal_task/core/errors/failure.dart';
import 'package:royal_task/core/usecase/usecase.dart';
import 'package:royal_task/core/common/entites/user.dart';

import '../repositories/auth_repo.dart';

class GetUserInfoUsecase implements Usecase<User, NoParams> {
  final AuthRepo _authRepo;

  GetUserInfoUsecase(this._authRepo);
  @override
  Future<Either<Failure, User>> call(NoParams params) {
    return _authRepo.getUserInfo();
  }
}
