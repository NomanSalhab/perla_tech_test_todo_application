import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'register_full_name_text_field_widget.dart';
import 'register_header_widget.dart';
import 'register_bottom_bar.dart';
import 'register_password_confirmation_text_field_widget.dart';
import 'register_password_text_field_widget.dart';
import 'register_phone_number_text_field_widget.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
            top: 60.h, left: 14.4.w, right: 14.4.w, bottom: 8.h),
        itemExtent: 100.h,
        children: const [
          RegisterHeaderWidget(),
          RegisterFullNameTextFieldWidget(),
          RegisterPhoneNumberTextFieldWidget(),
          RegisterPasswordTextFieldWidget(),
          RegisterPasswordConfirmationTextFieldWidget(),
        ],
      ),
      bottomNavigationBar: const RegisterBottomBar(),
    );
  }
}
