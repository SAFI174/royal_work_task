abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
  @override
  String toString() {
    return message;
  }
}

class CacheFailure extends Failure {
  CacheFailure({required super.message});
  @override
  String toString() {
    return message;
  }
}
