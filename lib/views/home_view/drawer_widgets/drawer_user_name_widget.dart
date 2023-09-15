import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../view_models/session_view_model.dart';

class DrawerUserNameWidget extends StatelessWidget {
  const DrawerUserNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionViewModel>(
      builder: (context, model, _) {
        return SizedBox(
          height: 60.h,
          // padding: EdgeInsets.symmetric(vertical: 23.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                model.getUser.username,
                style: TextStyle(
                  color: model.getDarkMode ? whiteColor : blackColor,
                  fontSize: 21.spMin,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
