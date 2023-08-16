import 'dart:io';
import 'package:udtscc/FollowMe/models/sql/font_size_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBFs {
  late Database database;

  Future<bool> initDB() async {
    try {
      const String dbName = 'DBFs.db';
      final String dbPath = await getDatabasesPath();
      final String path = join(dbPath, dbName);

      if (!await Directory(dirname(path)).exists()) {
        await Directory(dirname(path)).create(recursive: true);
      } else {}
      database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          String sql = "CREATE TABLE $tableFs ("
              "$columnId INTEGER PRIMARY KEY,"
              "$columnFs TEXT"
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

  Future<List<FontSizeDb>> getFs() async {
    List<Map> maps = await database.query(
      tableFs,
      columns: [columnId, columnFs],
    );

    if (maps.isNotEmpty) {
      return maps.map((p) => FontSizeDb.fromMap(p)).toList();
    }
    return [];
  }

  Future<FontSizeDb> insertFs(FontSizeDb fs) async {
    fs.id = await database.insert(tableFs, fs.toMap());
    // product.id = await database.rawInsert("INSERT Into ....");
    return fs;
  }

  Future<int> updateFs(FontSizeDb fs) async {
    return await database.update(
      tableFs,
      fs.toMap(),
      where: "$columnId = ?",
      whereArgs: [fs.id],
    );
  }

  Future<int> deleteAll() async {
    return await database.rawDelete('DELETE FROM $tableFs ', []);
  }
}
