import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/item_model.dart';
import '../../../models/user_model.dart';
import '../../../repository/items_repo.dart';
import '../../../repository/registration_repo.dart';

part 'items_list_event.dart';

part 'items_list_state.dart';

class ItemsListBloc extends Bloc<ItemsListEvent, ItemListState> {
  List<ItemModel> items = [];
  UserModel user = UserModel(id: 0, username: '', phone: '', timestamp: DateTime.now());

  ItemsListBloc() : super(ItemsListInitial(items: [])) {
    on<AddItem>(_addItem);
    on<DeleteItem>(_deleteItem);
    on<EditItem>(_editItem);
    on<GetAllItems>(_getItemsList);
  }

  Future<void> _addItem(AddItem event, Emitter<ItemListState> emit) async {
    state.items.add(event.item);
    await ItemsRepo().addItem(event.userId, event.item.content);
    emit(ItemsListUpdated(items: state.items));
  }

  Future<void> _deleteItem(DeleteItem event, Emitter<ItemListState> emit) async {
    for (int i = 0; i < state.items.length; i++) {
      if (event.item.id == state.items.elementAt(i).id) {
        await ItemsRepo().deleteItem(event.item.id);
        state.items.removeAt(i);
      }
    }
    emit(ItemsListUpdated(items: state.items));
  }

  Future<void> _editItem(EditItem event, Emitter<ItemListState> emit) async {
    for (int i = 0; i < state.items.length; i++) {
      if (event.item.id == state.items.elementAt(i).id) {
        await ItemsRepo().editItem(event.item);
        state.items[i] = event.item;
      }
    }
    emit(ItemsListUpdated(items: state.items));
  }

  Future<List<ItemModel>> _getItemsList(
      GetAllItems event, Emitter<ItemListState> emit) async {
    user = RegistrationRepo().getUserFromStorage();
    final thisItems = await ItemsRepo().getItems(user.id);
    state.items = thisItems;
    emit(ItemsListUpdated(items: thisItems));
    items = thisItems;
    return thisItems;
  }
}
