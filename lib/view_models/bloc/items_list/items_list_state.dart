part of 'items_list_bloc.dart';

abstract class ItemListState {
  List<ItemModel> items;

  ItemListState({required this.items});
}

class ItemsListInitial extends ItemListState {
  ItemsListInitial({required List<ItemModel> items}) : super(items: items);
}

class ItemsListUpdated extends ItemListState {
  ItemsListUpdated({required List<ItemModel> items}) : super(items: items);
}