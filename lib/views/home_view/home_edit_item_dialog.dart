import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/translations.dart';
import '../../models/item_model.dart';
import '../../view_models/session_view_model.dart';

Future<void> showEditItemDialog(BuildContext context, ItemModel item) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Consumer<SessionViewModel>(builder: (context, model, _) {
        return AlertDialog(
          title: const Text(editItemTranslationText).tr(),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextField(
                  controller: model.editItemController,
                  onChanged: (text) => model.changeEditItemText(text),
                  maxLines: 5,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: greyColor.withOpacity(0.15),
                    // prefixIcon: const Icon(Icons.edit, color: greyColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.spMin),
                      borderSide: BorderSide(
                          width: 0, color: greyColor.withOpacity(0.15)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.spMin),
                      borderSide: BorderSide(
                          width: 0, color: greyColor.withOpacity(0.15)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(editItemTranslationText).tr(),
              onPressed: () async {
                if (model.getEditItemText.isNotEmpty) {
                  await model
                      .editItem(ItemModel(
                        id: item.id,
                        userId: item.userId,
                        content: model.getEditItemText,
                        date: DateTime.now(),
                      ))
                      .then((value) => Navigator.of(context).pop());
                }
              },
            ),
            TextButton(
              child: const Text(cancelTranslationText).tr(),
              onPressed: () {
                model.setEditItemText('');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
    },
  );
}
