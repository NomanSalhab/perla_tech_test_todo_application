import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/translations.dart';
import '../../view_models/login_view_model.dart';

class LoginPhoneNumberTextFieldWidget extends StatelessWidget {
  const LoginPhoneNumberTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, model, child) {
        return SizedBox(
          height: 100.h,
          width: 320.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              child!,
              TextField(
                controller: model.phoneNumberController,
                onChanged: (text) => model.changePhoneNumberText(),
                decoration: InputDecoration(
                  hintText: enterYourPhoneNumberTranslationText.tr(),
                  hintStyle: const TextStyle(
                    color: greyColor,
                  ),
                  filled: true,
                  fillColor: greyColor.withOpacity(0.15),
                  prefixIcon: const Icon(Icons.call, color: greyColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.spMin),
                    borderSide: BorderSide(width: 0, color: greyColor.withOpacity(0.15)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.spMin),
                    borderSide: BorderSide(width: 0, color: greyColor.withOpacity(0.15)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      child: Text(
        phoneNumberTranslationText.tr(),
        style: TextStyle(
          fontSize: 18.spMin,
          fontWeight: FontWeight.w500,
          color: blackColor,
        ),
      ),
    );
  }
}
