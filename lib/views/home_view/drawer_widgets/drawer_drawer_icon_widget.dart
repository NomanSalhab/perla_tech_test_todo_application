import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noman_salhab_perla_tech_test/view_models/session_view_model.dart';
import 'package:provider/provider.dart';

import '../../../constants/assets.dart';
import '../../../constants/colors.dart';

class DrawerDrawerIconWidget extends StatelessWidget {
  const DrawerDrawerIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionViewModel>(
      builder: (context, model, _) {
        return SizedBox(
          height: 69.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Scaffold.of(context).closeDrawer(),
                borderRadius: BorderRadius.circular(100.spMax),
                splashColor: blueColor,
                child: Container(
                  decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(10.spMin),
                  child: Image.asset(
                    drawerDrawerIconAsset,
                    width: 24.w,
                    height: 24.w,
                    color: model.getDarkMode ? whiteColor : blackColor,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
