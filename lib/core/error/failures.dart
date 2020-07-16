abstract class Failure {
  String message;

  void setMessage(String message) {
    this.message = message;
  }
}

class ServerFailure extends Failure {}

class GeolocatorAccessFailure extends Failure {}