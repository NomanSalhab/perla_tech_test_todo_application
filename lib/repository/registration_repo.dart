import 'dart:convert';
import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../constants/http_links.dart';
import '../models/login_user_model.dart';
import '../models/user_model.dart';

class RegistrationRepo {
  UserModel getUserFromStorage() {
    final userBox = Hive.box('user');
    final UserModel u = UserModel(
      id: userBox.get('id') ?? 0,
      username: userBox.get('user_name') ?? '',
      phone: userBox.get('phone') ?? '',
      timestamp: userBox.get('timestamp') ?? DateTime.now(),
    );
    return u;
  }
  void setUser(UserModel user) {
    final userBox = Hive.box('user');
    userBox.putAll({
      'token': token,
      'id': user.id,
      'user_name': user.username,
      'phone': user.phone,
      'timestamp': user.timestamp,
      'loggedIn': true,
    });
  }

  Future<bool> logout() async {
    final userBox = Hive.box('user');
    return userBox.deleteAll([
      'token',
      'id',
      'user_name',
      'phone',
      'timestamp',
      'loggedIn'
    ]).then((value) => true);
  }

  Future<UserModel> register(
      String fullName, String phone, String password) async {
    final http.Response response = await http.post(
      registerUri,
      body: jsonEncode(
        <String, String>{
          "full_name": fullName,
          "phone": phone,
          "password": password,
        },
      ),
    );
    log('Register Response: ${jsonDecode(response.body)}');
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final data = body['data'];
      final String token = data['token'];
      setToken(token);
      final UserModel user = UserModel.fromJson(data['user']);
      setUser(user);
      return user;
    } else {
      final body = jsonDecode(response.body);
      final String message = body['message'];
      final UserModel user = UserModel(
          id: 0, username: message, phone: '', timestamp: DateTime.now());
      return user;
    }
  }

  Future<LoginUserModel> login(String phone, String password) async {
    final http.Response response = await http.post(
      loginUri,
      body: jsonEncode(
        <String, String>{
          "phone": phone,
          "password": password,
        },
      ),
    );
    log('Login Response: ${jsonDecode(response.body)}');
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final data = body['data'];
      final String token = data['token'];
      setToken(token);
      final LoginUserModel user = LoginUserModel.fromJson(data['user']);
      final UserModel userModel = UserModel(
        id: user.id,
        username: user.username,
        phone: user.phone,
        timestamp: user.timestamp,
      );
      setUser(userModel);
      return user;
    } else {
      final body = jsonDecode(response.body);
      final String message = body['message'];
      final LoginUserModel user = LoginUserModel(
        id: 0,
        username: message,
        phone: '',
        timestamp: DateTime.now(),
        points: 0,
        imagePath: '',
        userType: '',
      );
      return user;
    }
  }
}
