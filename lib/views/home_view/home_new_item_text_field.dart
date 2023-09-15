import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/translations.dart';
import '../../view_models/home_view_model.dart';
import '../../view_models/session_view_model.dart';

class HomeNewItemTextField extends StatelessWidget {
  const HomeNewItemTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionViewModel>(
      builder: (context, sessionModel, _) {
        return Consumer<HomeViewModel>(
          builder: (context, model, _) {
            return SizedBox(
              width: 240.w,
              child: TextField(
                controller: model.newItemController,
                onChanged: (text) => model.changeNewItemText(),
                decoration: InputDecoration(
                  hintText: enterYourTextTranslationText.tr(),
                  hintStyle: const TextStyle(
                    color: greyColor,
                  ),
                  filled: true,
                  fillColor: greyColor.withOpacity(0.15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.spMin),
                    borderSide: BorderSide(
                        width: 0, color: greyColor.withOpacity(0.15)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.spMin),
                    borderSide: BorderSide(
                        width: 0, color: greyColor.withOpacity(0.15)),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
