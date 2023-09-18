import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:noman_salhab_perla_tech_test/repository/registration_repo.dart';
import 'package:noman_salhab_perla_tech_test/views/separated_widgets/snack_bars.dart';

import '../constants/translations.dart';
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
    // log('FullNameText: ${fullNameText.trim()}');
    if (fullNameText.trim().isNotEmpty) {
      if (passwordText.length >= 8) {
        if (passwordText.compareTo(passwordConfirmationText) == 0) {
          if (validPassword(passwordText)) {
            final UserModel user = await RegistrationRepo()
                .register(fullNameText, phoneNumberText, passwordText);
            return user;
          } else {
            errorSnackBar(passwordIsNotValidTranslationText.tr(), context);
          }
        } else {
          errorSnackBar(
              passwordConfirmationDoesNotMatchThePasswordTranslationText.tr(),
              context);
        }
      } else {
        errorSnackBar(passwordLengthTranslationText.tr(), context);
      }
    } else {
      errorSnackBar(pleaseEnterYourNameTranslationText.tr(), context);
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

  bool validPassword(String pass) {
    RegExp passValid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
    String trimmedPassword = pass.trim();
    if (passValid.hasMatch(trimmedPassword)) {
      return true;
    } else {
      return false;
    }
  }

  String get getPhoneNumberText => phoneNumberText;

  String get getPasswordText => passwordText;

  String get getFullNameText => fullNameText;

  String get getPasswordConfirmationText => passwordConfirmationText;

  bool get getPasswordVisibility => passwordVisibility;

  bool get getPasswordConfirmationVisibility => passwordConfirmationVisibility;
}
