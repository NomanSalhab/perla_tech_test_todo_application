import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/translations.dart';
import '../../view_models/home_view_model.dart';
import '../../view_models/session_view_model.dart';

class HomeAddButton extends StatelessWidget {
  const HomeAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionViewModel>(
      builder: (context, sessionModel, _) {
        return Consumer<HomeViewModel>(
          builder: (context, model, _) {
            return MaterialButton(
              onPressed: () async {
                await model.addNewItem(context, model.getNewItemText);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.spMin),
              ),
              padding:
                  EdgeInsets.symmetric(horizontal: 13.2.w, vertical: 10.9.h),
              textColor: whiteColor,
              color: blueColor,
              child: SizedBox(
                width: 60.w,
                height: 40.h,
                child: Center(
                  child: model.getWaiting
                      ? const CircularProgressIndicator(
                          color: whiteColor,
                        )
                      : const Text(addTranslationText).tr(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
