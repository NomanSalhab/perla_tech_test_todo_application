import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:noman_salhab_perla_tech_test/repository/items_repo.dart';

import '../../../models/item_model.dart';

part 'items_list_event.dart';

part 'items_list_state.dart';

class ItemsListBloc extends Bloc<ItemsListEvent, ItemListState> {
  List<ItemModel> items = [];
  ItemsListBloc() : super(ItemsListInitial(items: [])) {
    on<AddItem>(_addItem);
    on<DeleteItem>(_deleteItem);
    on<EditItem>(_editItem);
    on<GetAllItems>(_getItemsList);
  }

  void _addItem(AddItem event, Emitter<ItemListState> emit) {
    state.items.add(event.item);
    emit(ItemsListUpdated(items: state.items));
  }

  void _deleteItem(DeleteItem event, Emitter<ItemListState> emit) {
    for (int i = 0; i < state.items.length; i++) {
      if (event.item.id == state.items.elementAt(i).id) {
        state.items.removeAt(i);
      }
    }
    emit(ItemsListUpdated(items: state.items));
  }

  void _editItem(EditItem event, Emitter<ItemListState> emit) {
    for (int i = 0; i < state.items.length; i++) {
      if (event.item.id == state.items.elementAt(i).id) {
        state.items[i] = event.item;
      }
    }
    emit(ItemsListUpdated(items: state.items));
  }

  Future<List<ItemModel>> _getItemsList(GetAllItems event, Emitter<ItemListState> emit) async {
    final thisItems = await ItemsRepo().getItems(0);
    state.items = thisItems;
    emit(ItemsListUpdated(items: thisItems));
    items = thisItems;
    return thisItems;
  }
}
