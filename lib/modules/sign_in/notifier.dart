import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/busy_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/error_notifier.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/safe_change_notifier.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_account.dart';
import 'package:new_horizons_encyclopedia/modules/forgot_password/view.dart';
import 'package:new_horizons_encyclopedia/modules/home/view.dart';
import 'package:new_horizons_encyclopedia/modules/sign_up/view.dart';
import 'package:new_horizons_encyclopedia/notifiers/current_user.dart';

class SignInNotifier extends SafeChangeNotifier
    with BusyNotifier, ErrorNotifier {
  late AppwriteAccount account;
  late CurrentUserNotifier currentUserNotifier;

  bool get rememberMe => _rememberMe;
  bool _rememberMe = false;
  set rememberMe(bool value) {
    if (_rememberMe != value) {
      _rememberMe = value;
      notifyListeners();
    }
  }

  Future<void> signIn(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    Session? session;
    User? user;
    try {
      session = await account.signIn(
        email: email,
        password: password,
      );
      user = await account.getCurrentUser();
    } on AppwriteException catch (e) {
      print(e);
    } finally {
      if (session != null && user != null) {
        currentUserNotifier.currentSession = session;
        currentUserNotifier.currentUser = user;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<HomeView>(
            builder: (context) => const HomeView(),
          ),
        );
      }
    }
  }

  void pushForgotPasswordView(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ForgotPasswordView(),
      ),
    );
  }

  void pushRegisterView(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignUpView(),
        ),
      );
}
