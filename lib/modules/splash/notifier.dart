import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/busy_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/error_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/loadable_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/safe_change_notifier.dart';
import 'package:new_horizons_encyclopedia/data/entities/authentication_result.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_account.dart';
import 'package:new_horizons_encyclopedia/notifiers/current_user.dart';

class SplashNotifier extends SafeChangeNotifier
    with BusyNotifier, ErrorNotifier, LoadableNotifier {
  late AppwriteAccount account;
  late CurrentUserNotifier currentUserNotifier;

  AuthenticationResult? get authenticationResult => _authenticationResult;
  AuthenticationResult? _authenticationResult;
  set authenticationResult(AuthenticationResult? value) {
    if (_authenticationResult != value) {
      _authenticationResult = value;
      notifyListeners();
    }
  }

  @override
  Future<void> load() async {
    User? user;
    Session? session;
    try {
      user = await account.getCurrentUser();
      session = await account.getCurrentSession();
    } on AppwriteException catch (e) {
      print(e);
    } finally {
      if (user == null || session == null) {
        authenticationResult = AuthenticationResult.navigateToAuthentication;
      } else {
        currentUserNotifier.currentUser = user;
        currentUserNotifier.currentSession = session;
        authenticationResult = AuthenticationResult.navigateToHome;
      }
    }
  }
}
