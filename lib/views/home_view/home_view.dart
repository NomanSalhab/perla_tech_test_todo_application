import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_add_button.dart';
import 'home_drawer_icon_widget.dart';
import 'drawer_widgets/home_drawer_widget.dart';
import 'home_list_widget.dart';
import 'home_new_item_text_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 34.5.h, horizontal: 14.4.w),
        children: [
          const HomeDrawerIconWidget(),
          SizedBox(
            height: 69.h,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeNewItemTextField(),
                HomeAddButton(),
              ],
            ),
          ),
          const HomeListWidget(),
        ],
      ),
      drawer: const HomeDrawerWidget(),
    );
  }
}
