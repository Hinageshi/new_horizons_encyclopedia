import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/safe_change_notifier.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_account.dart';
import 'package:new_horizons_encyclopedia/modules/sign_in/view.dart';
import 'package:new_horizons_encyclopedia/notifiers/current_user.dart';

class UserProfileNotifier extends SafeChangeNotifier {
  late AppwriteAccount account;
  late CurrentUserNotifier currentUserNotifier;

  Future<void> logOut(BuildContext context) async {
    final sessionId = currentUserNotifier.currentSession?.$id;
    if (sessionId != null) {
      try {
        await account.logOut(sessionId: sessionId);
        currentUserNotifier.currentSession = null;
        currentUserNotifier.currentUser = null;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<SignInView>(
            builder: (context) => const SignInView(),
          ),
        );
      } on AppwriteException catch (e) {
        print(e);
      }
    }
  }
}
