import 'package:flutter/material.dart';
import 'package:noman_salhab_perla_tech_test/repository/registration_repo.dart';

import '../models/login_user_model.dart';

class LoginViewModel with ChangeNotifier {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String phoneNumberText = '';
  String passwordText = '';
  bool passwordVisibility = false;
  bool waiting = false;

  Future<LoginUserModel> login() async {
    waiting = true;
    notifyListeners();
    final LoginUserModel user =
        await RegistrationRepo().login(phoneNumberText, passwordText);
    waiting = false;
    notifyListeners();
    return user;
  }

  void changePhoneNumberText() => phoneNumberText = phoneNumberController.text;

  void changePasswordText() => passwordText = passwordController.text;

  void switchPasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  String get getPhoneNumberText => phoneNumberText;

  String get getPasswordText => passwordText;

  bool get getPasswordVisibility => passwordVisibility;

  bool get getWaiting => waiting;
}
