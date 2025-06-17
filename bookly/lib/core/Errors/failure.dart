abstract class Failure {}

class ServerFailure extends Failure {
  final Object e;

  ServerFailure(this.e);
}
