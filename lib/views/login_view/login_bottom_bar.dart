import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/translations.dart';
import '../../models/user_model.dart';
import '../../view_models/login_view_model.dart';
import '../../view_models/session_view_model.dart';
import '../separated_widgets/snack_bars.dart';

class LoginBottomBar extends StatelessWidget {
  const LoginBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(builder: (context, model, _) {
      return BottomAppBar(
        surfaceTintColor: whiteColor,
        height: 110.h,
        padding: EdgeInsets.symmetric(horizontal: 14.4.w, vertical: 12.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: () async {
                if (!model.getWaiting) {
                  await model.login().then((value) {
                    if (value.id != 0) {
                      Provider.of<SessionViewModel>(context, listen: false)
                          .setUser(UserModel(
                              id: value.id,
                              username: value.username,
                              phone: value.phone,
                              timestamp: value.timestamp));
                      context.goNamed(homeViewRoutingText);
                      successSnackBar(loginSuccessTranslationText.tr(), context);
                    } else {
                      errorSnackBar(value.username, context);
                    }
                  });
                }
              },
              textColor: whiteColor,
              color: blueColor,
              padding: EdgeInsets.symmetric(vertical: 18.8.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.spMin)),
              child: Center(
                  child: model.getWaiting
                      ? SizedBox(
                          height: 24.h,
                          width: 24.h,
                          child: const CircularProgressIndicator(
                            color: whiteColor,
                          ),
                        )
                      : Text(
                          loginTranslationText.tr(),
                          style: TextStyle(
                              fontSize: 18.spMin, fontWeight: FontWeight.w400),
                        )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${doNotHaveAnAccountQuestionTranslationText.tr()} ',
                    style: TextStyle(color: greyColor, fontSize: 15.spMin)),
                InkWell(
                  onTap: () => context.goNamed(registerViewRoutingText),
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
