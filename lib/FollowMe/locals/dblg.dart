import 'dart:io';

import 'package:udtscc/FollowMe/models/sql/lg_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBLg {
  static Database? database;

  Future<bool> initDB() async {
    try {
      const String dbName = 'LGDb.db';
      final String dbPath = await getDatabasesPath();
      final String path = join(dbPath, dbName);

      if (!await Directory(dirname(path)).exists()) {
        await Directory(dirname(path)).create(recursive: true);
      } else {}
      database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          String sql = "CREATE TABLE $tableLg ("
              "$columnId INTEGER PRIMARY KEY,"
              "$columnLg TEXT"
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

  Future close() async => database!.close();

  Future<List<LGDb>> getLg() async {
    List<Map> maps = await database!.query(
      tableLg,
      columns: [columnId, columnLg],
    );

    if (maps.isNotEmpty) {
      return maps.map((p) => LGDb.fromMap(p)).toList();
    }
    return [];
  }

  Future<LGDb> insertLg(LGDb lg) async {
    lg.id = await database!.insert(tableLg, lg.toMap());
    // product.id = await database.rawInsert("INSERT Into ....");
    return lg;
  }

  Future<int> updateLg(LGDb lg) async {
    return await database!.update(
      tableLg,
      lg.toMap(),
      where: "$columnId = ?",
      whereArgs: [lg.id],
    );
  }

  Future<int> deleteAll() async {
    return await database!.rawDelete('DELETE FROM $tableLg ', []);
  }
}
