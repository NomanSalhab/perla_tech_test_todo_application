import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/translations.dart';
import '../../../view_models/session_view_model.dart';

class DrawerLanguageWidget extends StatelessWidget {
  const DrawerLanguageWidget({super.key});

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
                Icon(Icons.language,
                    color: model.getDarkMode ? whiteColor : blackColor),
                SizedBox(width: 7.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        model.switchLanguage(context, false);
                        Scaffold.of(context).closeDrawer();
                      },
                      child: Text(
                        englishTranslationText,
                        style: TextStyle(
                          color: model.getArabic
                              ? model.getDarkMode
                                  ? whiteColor
                                  : blackColor
                              : blueColor,
                        ),
                      ).tr(),
                    ),
                    Text(
                      '/',
                      style: TextStyle(
                        color: model.getDarkMode ? whiteColor : blackColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        model.switchLanguage(context, true);
                        Scaffold.of(context).closeDrawer();
                      },
                      child: Text(
                        arabicTranslationText,
                        style: TextStyle(
                          color: model.getArabic
                              ? blueColor
                              : model.getDarkMode
                                  ? whiteColor
                                  : blackColor,
                        ),
                      ).tr(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
