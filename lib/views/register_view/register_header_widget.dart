import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/translations.dart';

class RegisterHeaderWidget extends StatelessWidget {
  const RegisterHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: 320.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            createAccountTranslationText.tr(),
            style: TextStyle(
              fontSize: 21.spMin,
              fontWeight: FontWeight.w600,
              color: blueColor,
            ),
          ),
          Text(
            registerToGetStartedTranslationText.tr(),
            style: TextStyle(
              fontSize: 16.spMin,
              fontWeight: FontWeight.w500,
              color: greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
