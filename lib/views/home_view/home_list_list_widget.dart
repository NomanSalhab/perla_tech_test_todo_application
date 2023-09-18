import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../view_models/session_view_model.dart';
import 'home_item_widget.dart';

class HomeListListWidget extends StatelessWidget {
  const HomeListListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionViewModel>(builder: (context, model, _) {
      /*return BlocBuilder<ItemsListBloc, ItemListState>(
        builder: (context, state) {
          if (state is ItemsListUpdated && state.items.isNotEmpty) {
            final List<ItemModel> items = state.items;*/
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 1380.h,
                minHeight: 0.h,
                maxWidth: 320.w,
                minWidth: 319.w,
              ),
              child: ListView.separated(
                itemBuilder: (context, index) => HomeItemWidget(
                    item: model.getList /*items*/.elementAt(index)),
                separatorBuilder: (context, _) => SizedBox(
                  height: 6.9.h,
                ),
                itemCount: model.getList/*state.items*/.length,
              ),
            );
          /*} else {
            return Padding(
              padding: EdgeInsets.all(24.h),
              child: Center(
                child: Text(noItemsYetTranslationText.tr(), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.spMin)),
              ),
            );
          }
        },
      );*/
    });
  }
}
