import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationRepo {
  Locale local = const Locale('en', 'US');

  void switchLocal(BuildContext context, bool toArabic) {
    toArabic ? context.setLocale(const Locale('ar', 'AE')) : context.setLocale(const Locale('en', 'US'));
  }

  bool getLocalization(BuildContext context) {
    bool arabic = context.locale.languageCode.compareTo('ar') == 0;
    return arabic;
  }
}