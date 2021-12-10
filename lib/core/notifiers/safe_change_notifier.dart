import 'package:flutter/foundation.dart';

/// A [ChangeNotifier] that verifies it isn't disposed when calling [notifyListeners].
class SafeChangeNotifier extends ChangeNotifier {
  bool _mounted = true;

  @override
  void dispose() {
    super.dispose();
    _mounted = false;
  }

  @override
  void notifyListeners() {
    if (_mounted) {
      super.notifyListeners();
    }
  }
}
