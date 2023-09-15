import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:noman_salhab_perla_tech_test/view_models/session_view_model.dart';
import 'package:provider/provider.dart';

import '../../../constants/assets.dart';
import '../../../constants/colors.dart';
import '../../../constants/translations.dart';

class DrawerLogoutWidget extends StatelessWidget {
  const DrawerLogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionViewModel>(
      builder: (context, model, _) {
        return InkWell(
          onTap: () async {
            await model.logout().then((value) {
              if(value) {
                context.goNamed(registerViewRoutingText);
              }
            });
          },
          splashColor: redColor.withOpacity(0.4),
          borderRadius: BorderRadius.horizontal(
              right: Radius.circular(50.spMax), left: Radius.circular(50.spMax)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  logoutIconAsset,
                  color: redColor,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  logoutTranslationText,
                  style: TextStyle(
                    color: redColor,
                    fontSize: 15.5.spMin,
                  ),
                ).tr(),
              ],
            ),
          ),
        );
      }
    );
  }
}
