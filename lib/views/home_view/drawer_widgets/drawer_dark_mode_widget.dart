import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noman_salhab_perla_tech_test/view_models/session_view_model.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/translations.dart';

class DrawerDarkModeWidget extends StatelessWidget {
  const DrawerDarkModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionViewModel>(builder: (context, model, _) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                    model.getDarkMode
                        ? Icons.light_mode
                        : Icons.light_mode_outlined,
                    color: model.getDarkMode ? whiteColor : blackColor),
                SizedBox(width: 7.w),
                Text(
                  darkModeTranslationText,
                  style: TextStyle(
                      color:
                      model.getDarkMode ? whiteColor : blackColor),
                ).tr(),
              ],
            ),
          ),
          Switch(
            value: model.getDarkMode,
            onChanged: (value) => model.switchDarkMode(value),
            activeColor: blueColor,
          ),
        ],
      );
    });
  }
}
