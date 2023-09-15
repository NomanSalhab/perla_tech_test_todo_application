import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../models/item_model.dart';
import '../../view_models/session_view_model.dart';
import 'home_edit_item_dialog.dart';

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionViewModel>(builder: (context, model, _) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 155.w,
            child: Padding(
              padding: EdgeInsets.only(
                  right: model.getArabic ? 0.w : 8.w,
                  left: model.getArabic ? 8.w : 0.w),
              child: Text(
                item.content,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(
            width: 152.5.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 90.w,
                  child: Text(
                    getDate(item.date),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: 54.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          if (model.editItemText.isEmpty) {
                            model.setEditItemText(item.content);
                          }
                          await showEditItemDialog(context, item);
                        },
                        splashColor: blueColor,
                        borderRadius: BorderRadius.circular(100.spMin),
                        child: Padding(
                          padding: EdgeInsets.all(2.spMin),
                          child: const Icon(
                            Icons.edit,
                            color: blueColor,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => model.deleteItem(item.id),
                        splashColor: redColor,
                        borderRadius: BorderRadius.circular(100.spMin),
                        child: Padding(
                          padding: EdgeInsets.all(2.spMin),
                          child: const Icon(
                            Icons.delete_outline,
                            color: redColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  String getDate(DateTime date) {
    String time = '';
    time += '${date.day} ';
    switch (date.month) {
      case 1:
        time += 'Jan';
      case 2:
        time += 'Feb';
      case 3:
        time += 'Mar';
      case 4:
        time += 'Apr';
      case 5:
        time += 'May';
      case 6:
        time += 'Jun';
      case 7:
        time += 'Jul';
      case 8:
        time += 'Aug';
      case 9:
        time += 'Sep';
      case 10:
        time += 'Oct';
      case 11:
        time += 'Nov';
      case 12:
        time += 'Dec';
      default:
        time += 'Err';
    }
    time += ', ${date.year}';
    return time;
  }
}
