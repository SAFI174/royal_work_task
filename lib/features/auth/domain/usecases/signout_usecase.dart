import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repo.dart';

class SignoutUsecase implements Usecase<void, NoParams> {
  final AuthRepo _authRepo;
  SignoutUsecase(this._authRepo);
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return _authRepo.signOut();
  }
}
