import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'session_view_model.dart';

class HomeViewModel with ChangeNotifier {
  final TextEditingController newItemController = TextEditingController();
  String newItemText = '';
  bool waiting = false;

  void changeNewItemText() => newItemText = newItemController.text;

  Future<bool> addNewItem(BuildContext context, String itemText) async {
    waiting = true;
    notifyListeners();
    await Provider.of<SessionViewModel>(context, listen: false)
        .addItem(itemText);
    waiting = false;
    newItemController.clear();
    newItemText = '';
    notifyListeners();
    return true;
  }

  String get getNewItemText => newItemText;

  bool get getWaiting => waiting;
}
