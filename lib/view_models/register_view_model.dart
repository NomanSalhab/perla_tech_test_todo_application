import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:noman_salhab_perla_tech_test/repository/registration_repo.dart';
import 'package:noman_salhab_perla_tech_test/views/separated_widgets/snack_bars.dart';

import '../models/user_model.dart';

class RegisterViewModel with ChangeNotifier {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  String fullNameText = '';
  String phoneNumberText = '';
  String passwordConfirmationText = '';
  String passwordText = '';
  bool passwordVisibility = false;
  bool passwordConfirmationVisibility = false;

  Future<UserModel> register(BuildContext context) async {
    log('FullNameText: ${fullNameText.trim()}');
      if (fullNameText.trim().length >= 6) {
        if (fullNameText.trim().contains(' ')) {
          if (passwordText.length >= 8) {
            if (passwordText.compareTo(passwordConfirmationText) == 0) {
              final UserModel user = await RegistrationRepo().register(fullNameText, phoneNumberText, passwordText);
              return user;
            } else {
              errorSnackBar('passwordConfirmationText', context);
            }
          } else {
            errorSnackBar('passwordText', context);
          }
        } else {
          errorSnackBar('fullNameText', context);
        }
      } else {
        errorSnackBar('text0', context);
      }
    return UserModel(id: 0, username: '', phone: '', timestamp: DateTime.now());
  }

  void changePhoneNumberText() => phoneNumberText = phoneNumberController.text;

  void changePasswordText() => passwordText = passwordController.text;

  void changeFullNameText() => fullNameText = fullNameController.text;

  void changePasswordConfirmationText() =>
      passwordConfirmationText = passwordConfirmationController.text;

  void switchPasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  void switchPasswordConfirmationVisibility() {
    passwordConfirmationVisibility = !passwordConfirmationVisibility;
    notifyListeners();
  }

  String get getPhoneNumberText => phoneNumberText;

  String get getPasswordText => passwordText;

  String get getFullNameText => fullNameText;

  String get getPasswordConfirmationText => passwordConfirmationText;

  bool get getPasswordVisibility => passwordVisibility;

  bool get getPasswordConfirmationVisibility => passwordConfirmationVisibility;
}
