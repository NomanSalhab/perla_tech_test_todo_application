import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../view_models/session_view_model.dart';
import 'drawer_dark_mode_widget.dart';
import 'drawer_drawer_icon_widget.dart';
import 'drawer_language_widget.dart';
import 'drawer_logout_widget.dart';
import 'drawer_user_name_widget.dart';

class HomeDrawerWidget extends StatefulWidget {
  const HomeDrawerWidget({super.key});

  @override
  State<HomeDrawerWidget> createState() => _HomeDrawerWidgetState();
}

class _HomeDrawerWidgetState extends State<HomeDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SessionViewModel>(
      builder: (context, model, _) {
        return Drawer(
          width: 288.w,
          backgroundColor:
              model.getDarkMode ? darkScaffoldBackgroundColor : whiteColor,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 34.5.h, horizontal: 20.w),
            itemExtent: 60.h,
            children: const [
              DrawerDrawerIconWidget(),
              DrawerUserNameWidget(),
              DrawerDarkModeWidget(),
              DrawerLanguageWidget(),
              DrawerLogoutWidget(),
            ],
          ),
        );
      },
    );
  }
}
