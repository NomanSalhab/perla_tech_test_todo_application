import 'package:flutter/material.dart';

import '../models/item_model.dart';
import '../models/user_model.dart';
import '../repository/items_repo.dart';
import '../repository/localization_repo.dart';
import '../repository/registration_repo.dart';

class SessionViewModel with ChangeNotifier {
  UserModel user = UserModel(
      id: 0, username: '', phone: '', timestamp: DateTime.now());
  bool waiting = false;
  bool darkMode = false;
  bool arabic = false;
  List<ItemModel> items = [];
  final TextEditingController editItemController = TextEditingController();
  String editItemText = '';

  void changeEditItemText(String text) => editItemText = text;
  void changeEditItemControllerText(String text) => editItemController.text = text;

  Future<void> setList() async {
    items = await ItemsRepo().getItems(user.id);
    notifyListeners();
  }

  void getUserFromStorage() {
    final UserModel u = RegistrationRepo().getUserFromStorage();
    setUser(u);
  }

  Future<void> editItem(ItemModel item) async {
    await ItemsRepo().editItem(item);
    await setList();
    setEditItemText('');
    notifyListeners();
  }

  void setEditItemText(String text) {
    editItemController.text = text;
    editItemText = text;
    notifyListeners();
  }

  Future<void> deleteItem(int id) async {
    await ItemsRepo().deleteItem(id);
    await setList();
    notifyListeners();
  }

  Future<void> addItem(String itemText) async {
    if(itemText.trim().isNotEmpty) {
      ItemsRepo().addItem(user.id, itemText);
      await setList();
      notifyListeners();
    }
  }

  void setArabic(BuildContext context) {
    arabic = LocalizationRepo().getLocalization(context);
  }

  Future<void> switchDarkMode(bool value) async {
    final bool darkModeResult = await Future.delayed(
      const Duration(milliseconds: 100),
      () {
        return !darkMode;
      },
    );
    darkMode = darkModeResult;
    notifyListeners();
  }

  void switchLanguage(BuildContext context, bool toArabic) async {
    final bool toArabicResult = await Future.delayed(
      const Duration(milliseconds: 100),
      () {
        LocalizationRepo().switchLocal(context, toArabic);
        return toArabic;
      },
    );
    arabic = toArabicResult;
    notifyListeners();
  }

  void setUser(UserModel newUser) {
    user = newUser;
  }

  Future<bool> logout() async {
    waiting = true;
    notifyListeners();
    final bool logoutResult = await RegistrationRepo().logout().then(
      (value) {
        return value;
      },
    );
    waiting = false;
    notifyListeners();
    return logoutResult;
  }

  UserModel get getUser => user;

  bool get getWaiting => waiting;

  bool get getDarkMode => darkMode;

  bool get getArabic => arabic;

  List<ItemModel> get getList => items;

  String get getEditItemText => editItemText;
}
