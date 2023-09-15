import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/translations.dart';
import '../../view_models/session_view_model.dart';
import 'home_list_list_widget.dart';

class HomeListWidget extends StatelessWidget {
  const HomeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<SessionViewModel>(context, listen: false).getUserFromStorage();
    Provider.of<SessionViewModel>(context, listen: false).setList();
    return Consumer<SessionViewModel>(
      builder: (context, model, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: greyColor.withOpacity(0.4),
              ),
              padding: EdgeInsets.symmetric(vertical: 6.9.h, horizontal: 7.2.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 155.w,
                    child: const Text(textTranslationText).tr(),
                  ),
                  SizedBox(
                    width: 155.w,
                    child: const Text(dateTranslationText).tr(),
                  ),
                ],
              ),
            ),
            const HomeListListWidget(),
          ],
        );
      },
    );
  }
}
