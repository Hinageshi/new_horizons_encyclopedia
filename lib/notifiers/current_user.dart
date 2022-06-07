import 'package:appwrite/models.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/safe_change_notifier.dart';

class CurrentUserNotifier extends SafeChangeNotifier {
  User? get currentUser => _currentUser;
  User? _currentUser;
  set currentUser(User? value) {
    if (_currentUser != value) {
      _currentUser = value;
      notifyListeners();
    }
  }

  Session? get currentSession => _currentSession;
  Session? _currentSession;
  set currentSession(Session? value) {
    if (_currentSession != value) {
      _currentSession = value;
      notifyListeners();
    }
  }
}
