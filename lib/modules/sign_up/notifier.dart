import 'package:new_horizons_encyclopedia/core/notifiers/busy_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/error_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/safe_change_notifier.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_account.dart';

class SignUpNotifier extends SafeChangeNotifier
    with BusyNotifier, ErrorNotifier {
  late AppwriteAccount account;

  Future<void> signUp({
    required String email,
    required String password,
    String? name,
  }) async {
    final user = await account.signUp(
      email: email,
      password: password,
      name: name,
    );
  }
}
