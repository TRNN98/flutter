import 'dart:io';

import 'package:mwasc/promoney/models/sql/ie_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBIe {
  late Database database;

  Future<bool> initDB() async {
    try {
      const String dbName = 'IEDb.db';
      final String dbPath = await getDatabasesPath();
      final String path = join(dbPath, dbName);

      if (!await Directory(dirname(path)).exists()) {
        await Directory(dirname(path)).create(recursive: true);
      } else {}
      database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          String sql = "CREATE TABLE $tableIe ("
              "$columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
              "$columnType TEXT,"
              "$columnDescription TEXT,"
              "$columnAmount TEXT"
              ")";
          await db.execute(sql);
        },
        onUpgrade: (Database db, int oldVersion, int newVersion) {},
        onOpen: (Database db) async {},
      );
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future close() async => database.close();

  Future<List<IEJsonDb>> getIe() async {
    List<Map> maps = await database.query(
      tableIe,
      columns: [columnId, columnType, columnDescription, columnAmount],
    );
    if (maps.isNotEmpty) {
      return maps.map((p) => IEJsonDb.fromMap(p)).toList();
    }
    return [];
  }

  Future<IEDb> insertIe(IEDb ie) async {
    ie.id = await database.insert(tableIe, ie.toMap());
    return ie;
  }

  Future<int> updateLg(IEDb ie) async {
    return await database.update(
      tableIe,
      ie.toMap(),
      where: "$columnId = ?",
      whereArgs: [ie.id],
    );
  }

  Future<int> deleteIe(int id) async {
    return await database
        .delete(tableIe, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    return await database.rawDelete('DELETE FROM $tableIe ', []);
  }
}
