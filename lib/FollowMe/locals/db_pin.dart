import 'dart:io';

import 'package:udtscc/FollowMe/models/sql/pin_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBPin {
  late Database database;

  Future<bool> initDB() async {
    try {
      const String dbName = 'PinDb.db';
      final String dbPath = await getDatabasesPath();
      final String path = join(dbPath, dbName);
      if (!await Directory(dirname(path)).exists()) {
        await Directory(dirname(path)).create(recursive: true);
      } else {}
      database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          String sql = "CREATE TABLE $tablePin ("
              "$columnId INTEGER PRIMARY KEY,"
              "$columnPinNumber TEXT"
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

  Future<List<PinDb>> getPins() async {
    List<Map> maps = await database.query(
      tablePin,
      columns: [columnId, columnPinNumber],
    );
    if (maps.isNotEmpty) {
      return maps.map((p) => PinDb.fromMap(p)).toList();
    }
    return [];
  }

  Future<PinDb> insertPins(PinDb pins) async {
    pins.id = await database.insert(tablePin, pins.toMap());

    return pins;
  }

  Future<int> updatePins(PinDb pins) async {
    return await database.update(
      tablePin,
      pins.toMap(),
      where: "$columnId = ?",
      whereArgs: [pins.id],
    );
  }

  Future<int> deleteAll() async {
    return await database.rawDelete('DELETE FROM $tablePin ', []);
  }
}
