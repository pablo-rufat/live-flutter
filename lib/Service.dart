import 'package:writers/models/AuthPayload.dart';

class Service {
  static final Service _instance = Service._internal();
  factory Service() => _instance;

  Service._internal() {
    _currentUser = new AuthPayload(token: null, user: null);
  }

  late AuthPayload _currentUser;

  AuthPayload get currentUser => _currentUser;

  set currentUser(AuthPayload currentUser) => _currentUser = currentUser;
}
