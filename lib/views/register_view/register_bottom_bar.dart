import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:noman_salhab_perla_tech_test/view_models/register_view_model.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/translations.dart';
import '../../view_models/session_view_model.dart';
import '../separated_widgets/snack_bars.dart';

class RegisterBottomBar extends StatelessWidget {
  const RegisterBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterViewModel>(builder: (context, model, _) {
      return BottomAppBar(
        surfaceTintColor: whiteColor,
        height: 110.h,
        padding: EdgeInsets.symmetric(horizontal: 14.4.w, vertical: 12.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: () async {
                await model.register(context).then((value) {
                  if (value.id != 0) {
                    Provider.of<SessionViewModel>(context, listen: false)
                        .setUser(value);
                    context.goNamed(homeViewRoutingText);
                    successSnackBar(registerSuccessTranslationText.tr(), context);
                  } else {
                    errorSnackBar(value.username, context);
                  }
                });
              },
              textColor: whiteColor,
              color: blueColor,
              padding: EdgeInsets.symmetric(vertical: 18.8.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.spMin)),
              child: Center(
                  child: Text(
                registerTranslationText.tr(),
                style:
                    TextStyle(fontSize: 18.spMin, fontWeight: FontWeight.w400),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${doNotHaveAnAccountQuestionTranslationText.tr()} ',
                    style: TextStyle(color: greyColor, fontSize: 15.spMin)),
                InkWell(
                  onTap: () => context.goNamed(loginViewRoutingText),
                  splashColor: blueColor.withOpacity(0.4),
                  child: Text(
                    registerTranslationText.tr(),
                    style: TextStyle(
                      color: blueColor,
                      fontSize: 15.spMin,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
