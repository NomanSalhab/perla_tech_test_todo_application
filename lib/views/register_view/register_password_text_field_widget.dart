import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/translations.dart';
import '../../view_models/register_view_model.dart';

class RegisterPasswordTextFieldWidget extends StatelessWidget {
  const RegisterPasswordTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterViewModel>(builder: (context, model, child) {
      return SizedBox(
        height: 100.h,
        width: 320.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            child!,
            TextField(
              controller: model.passwordController,
              onChanged: (text) => model.changePasswordText(),
              obscureText: !model.getPasswordVisibility,
              decoration: InputDecoration(
                hintText: enterYourPasswordTranslationText.tr(),
                hintStyle: const TextStyle(
                  color: greyColor,
                ),
                filled: true,
                fillColor: greyColor.withOpacity(0.15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.spMin),
                  borderSide:
                      BorderSide(width: 0, color: greyColor.withOpacity(0.15)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.spMin),
                  borderSide:
                      BorderSide(width: 0, color: greyColor.withOpacity(0.15)),
                ),
                suffixIcon: IconButton(
                  onPressed: () => model.switchPasswordVisibility(),
                  icon: Icon(
                    !model.getPasswordVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: blueColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
    child: Text(
      passwordTranslationText.tr(),
      style: TextStyle(
        fontSize: 18.spMin,
        fontWeight: FontWeight.w500,
        color: blackColor,
      ),
    ),
    );
  }
}
