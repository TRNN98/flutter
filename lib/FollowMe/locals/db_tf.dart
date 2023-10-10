import 'dart:io';

import 'package:mwasc/FollowMe/models/sql/tf_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBTf {
  dynamic database;

  Future<bool> initDB() async {
    try {
      const String dbName = 'TFDb.db';
      final String dbPath = await getDatabasesPath();
      final String path = join(dbPath, dbName);

      if (!await Directory(dirname(path)).exists()) {
        await Directory(dirname(path)).create(recursive: true);
      } else {}
      database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          String sql = "CREATE TABLE $tableTf ("
              "$columnId INTEGER PRIMARY KEY,"
              "$columnTf TEXT"
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

  Future<List<TFDb>> getTf() async {
    List<Map> maps = await database.query(
      tableTf,
      columns: [columnId, columnTf],
    );

    if (maps.isNotEmpty) {
      return maps.map((p) => TFDb.fromMap(p)).toList();
    }
    return [];
  }

  Future<TFDb> insertTf(TFDb tf) async {
    tf.id = await database.insert(tableTf, tf.toMap());
    // product.id = await database.rawInsert("INSERT Into ....");
    return tf;
  }

  Future<int> updateTf(TFDb tf) async {
    return await database.update(
      tableTf,
      tf.toMap(),
      where: "$columnId = ?",
      whereArgs: [tf.id],
    );
  }

  Future<int> deleteAll() async {
    return await database.rawDelete('DELETE FROM $tableTf ', []);
  }
}
