import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_header_widget.dart';
import 'login_bottom_bar.dart';
import 'login_password_text_field_widget.dart';
import 'login_phone_number_text_field_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
            top: 60.h, left: 14.4.w, right: 14.4.w, bottom: 8.h),
        itemExtent: 100.h,
        children: const [
          LoginHeaderWidget(),
          LoginPhoneNumberTextFieldWidget(),
          LoginPasswordTextFieldWidget(),
        ],
      ),
      bottomNavigationBar: const LoginBottomBar(),
    );
  }
}
