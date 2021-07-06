class Service {
  static final Service _instance = Service._internal();
  factory Service() => _instance;

  Service._internal() {
    _currentUser = {};
  }

  late Object _currentUser;

  Object get currentUser => _currentUser;
  set currentUser(Object currentUser) => _currentUser = currentUser;
}
