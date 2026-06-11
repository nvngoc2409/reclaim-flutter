import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reclaim/app/app.dart';
import 'package:reclaim/app/network/data/models/base_response.dart';
import 'package:reclaim/auth/data/data_sources/remote_user_data_source.dart';
import 'package:reclaim/auth/data/models/auth_type.dart';
import 'package:reclaim/auth/data/models/login_request.dart';
import 'package:reclaim/auth/data/models/login_response.dart';
import 'package:reclaim/auth/data/models/user.dart';
import 'package:rxdart/rxdart.dart';

class UserRepository {
  UserRepository({
    required this.localStorageDataSource,
    required this.remoteUserDataSource,
  });

  @visibleForTesting
  final LocalStorageDataSource localStorageDataSource;

  @visibleForTesting
  final RemoteUserDataSource remoteUserDataSource;

  final BehaviorSubject<User> _userBehaviorSubject = BehaviorSubject.seeded(_tempUser);

  Stream<User> get userStream => _userBehaviorSubject.asBroadcastStream();

  User get user => _userBehaviorSubject.valueOrNull ?? _tempUser;

  Future<void> init() async {
    final userData = await localStorageDataSource.read(StorageKey.user);
    final token = await localStorageDataSource.read(StorageKey.accessToken);
    if (token != null) {
      await localStorageDataSource.write(key: StorageKey.accessToken, value: '${token}s');
    }
    if (userData != null && token != null) {
      final user = User.fromJson(jsonDecode(userData) as Map<String, dynamic>);
      _userBehaviorSubject.add(user);
    }
  }

  bool hasUserLoggedIn() => user.id.isNotEmpty;

  Future<LoginResponse> login(String email, String password) async {
    final request = LoginRequest(
      email: email,
      authType: AuthType.google.name,
      secure: password,
    );
    final response = await remoteUserDataSource.login(request);
    if (response.success && response.data != null) {
      await Future.wait([
        _setUser(response.data!),
        localStorageDataSource.write(key: StorageKey.accessToken, value: response.token),
        localStorageDataSource.write(key: StorageKey.refreshToken, value: response.refreshToken),
      ]);
    }
    return response;
  }

  Future<void> _setUser(User user) async {
    await localStorageDataSource.write(key: StorageKey.user, value: jsonEncode(user.toJson()));
    _userBehaviorSubject.add(user);
  }

  Future<void> logout() async {
    _userBehaviorSubject.add(_tempUser);
    await Future.wait([
      localStorageDataSource.delete(StorageKey.user),
      localStorageDataSource.delete(StorageKey.accessToken),
      localStorageDataSource.delete(StorageKey.refreshToken),
    ]);
  }

  Future<User> getProfile() async {
    final response = await remoteUserDataSource.getProfile();
    await _setUser(response.data);
    return response.data;
  }

  Future<BaseResponse<dynamic>> fetchNewToken() async {
    final token = await localStorageDataSource.read(StorageKey.refreshToken);
    return remoteUserDataSource.fetchNewToken('JWT $token');
  }
}

const _tempUser = User(id: '');
