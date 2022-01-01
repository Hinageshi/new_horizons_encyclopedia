import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_client.dart';

class AppwriteAccount {
  AppwriteAccount({
    required AppwriteClient client,
  })  : _client = client,
        _account = Account(
          client.client,
        );

  factory AppwriteAccount.update({
    required AppwriteClient client,
    required AppwriteAccount? old,
  }) {
    if (old == null || client != old._client) {
      return AppwriteAccount(
        client: client,
      );
    } else {
      return old;
    }
  }

  final AppwriteClient _client;
  final Account _account;

  Future<User> signUp({
    required String email,
    required String password,
    String? name,
  }) async =>
      _account.create(
        email: email,
        password: password,
        name: name,
      );

  Future<Session> signIn({
    required String email,
    required String password,
  }) async =>
      _account.createSession(
        email: email,
        password: password,
      );

  Future<User> getCurrentUser() async => _account.get();

  Future<Preferences> getPreferences() async => _account.getPrefs();

  Future<User> updateName({
    required String name,
  }) async =>
      _account.updateName(
        name: name,
      );

  Future<User> updatePassword({
    required String password,
  }) async =>
      _account.updatePassword(
        password: password,
      );

  Future<User> updatePreferences({
    required Map<String, dynamic> preferences,
  }) async =>
      _account.updatePrefs(
        prefs: preferences,
      );
}
