import 'package:dartz/dartz.dart';
import 'package:royal_task/core/errors/failure.dart';

abstract class Usecase<Success, Params> {
  Future<Either<Failure, Success>> call(Params params);
}

class NoParams {}
