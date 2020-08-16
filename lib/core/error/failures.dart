abstract class Failure {
  String text;

  void setMessage(String message) {
    text = message;
  }

  String message() {
    return text;
  }
}

class ServerFailure extends Failure {}

class GeolocatorAccessFailure extends Failure {}

class InvalidTokenFailure extends Failure {}

class NoTokenFailure extends Failure {}

class GeolocationFailure extends Failure {
  GeolocationFailure() {
    text = 'Localização não habilitada';
  }
}
