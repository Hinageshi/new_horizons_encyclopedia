import 'package:new_horizons_encyclopedia/core/notifiers/busy_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/error_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/safe_change_notifier.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_account.dart';

class ForgotPasswordNotifier extends SafeChangeNotifier
    with BusyNotifier, ErrorNotifier {
  late AppwriteAccount account;
}
