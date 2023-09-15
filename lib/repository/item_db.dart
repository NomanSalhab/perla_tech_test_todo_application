import 'package:sqflite/sqflite.dart';

import '../models/item_model.dart';
import 'items_repo.dart';

class ItemDB {
  final String tableName = 'items';

  Future<void> createTable(Database database) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        "id" INTEGER NOT NULL,
        "user_id" INTEGER NOT NULL,
        "content" TEXT NOT NULL,
        "date" TEXT NOY NULL,
        PRIMARY KEY("id" AUTOINCREMENT)
      );
    ''');
  }

  Future<int> create(int userId, String content) async {
    final database = await ItemsRepo().getDatabase;
    return await database.rawInsert(
      '''
      INSERT INTO $tableName (user_id, content, date) VALUES (?,?,?)
    ''',
      [userId, content, DateTime.now().toIso8601String()],
    );
  }

  Future<List<ItemModel>> fetchAll(int userId) async {
    final database = await ItemsRepo().getDatabase;
    final items = await database.rawQuery('''
      SELECT * FROM $tableName WHERE user_id = ? ORDER BY date
    ''', [userId]);
    return items.map((e) => ItemModel.fromJson(e)).toList();
  }

  Future<ItemModel> fetchItemById(int id) async {
    final database = await ItemsRepo().getDatabase;
    final item = await database.rawQuery('''
      SELECT * FROM $tableName WHERE id = ?
    ''', [id]);
    return ItemModel.fromJson(item.first);
  }

  Future<int> edit(int id, String content) async {
    final database = await ItemsRepo().getDatabase;
    return await database.update(
      tableName,
      {
        if (content.isNotEmpty) 'content': content,
      },
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.replace,
      whereArgs: [id],
    );
  }

  Future<void> delete(int id) async {
    final database = await ItemsRepo().getDatabase;
    await database.rawDelete('''
      DELETE FROM $tableName WHERE id = ?
    ''', [id]);
  }
}
