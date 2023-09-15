part of 'items_list_bloc.dart';

@immutable
abstract class ItemsListEvent {}

class AddItem extends ItemsListEvent {
  final ItemModel item;

  AddItem(this.item);
}

class DeleteItem extends ItemsListEvent {
  final ItemModel item;

  DeleteItem(this.item);
}

class EditItem extends ItemsListEvent {
  final ItemModel item;

  EditItem(this.item);
}

class GetAllItems extends ItemsListEvent {
  final List<ItemModel> items;

  GetAllItems(this.items);
}