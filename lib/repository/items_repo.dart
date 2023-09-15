import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/item_model.dart';
import 'item_db.dart';

class ItemsRepo {
  Database? _database;

  Future<Database> get getDatabase async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initialize();
      return _database!;
    }
  }

  Future<String> get fullPath async {
    const name = 'items_database.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    var database0 = await openDatabase(path,
        version: 1, onCreate: create, singleInstance: true);
    return database0;
  }

  Future<void> create(Database database1, int version) async =>
      await ItemDB().createTable(database1);

  List<ItemModel> items = [];

  Future<void> addItem(int userId, String content) async {
    await ItemDB().create(userId, content);
  }

  Future<List<ItemModel>> getItems(int userId) async {
    return await ItemDB().fetchAll(userId);
  }

  Future<void> editItem(ItemModel item) async {
    await ItemDB().edit(item.id, item.content);
  }

  Future<void> deleteItem(int id) async {
    await ItemDB().delete(id);
  }
}
