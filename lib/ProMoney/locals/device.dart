import 'dart:io';
import 'package:udtscc/promoney/models/sql/device_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBDevice {
  late Database database;

  Future<bool> initDB() async {
    try {
      const String dbName = 'DeviceDb.db';
      final String dbPath = await getDatabasesPath();
      final String path = join(dbPath, dbName);

      if (!await Directory(dirname(path)).exists()) {
        await Directory(dirname(path)).create(recursive: true);
      } else {}
      database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          String sql = "CREATE TABLE $tableDv ("
              "$columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
              "$columnStatus TEXT"
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

  Future<List<DeviceJsonDb>> getDevice() async {
    List<Map> maps = await database.query(
      tableDv,
      columns: [columnId, columnStatus],
    );
    if (maps.isNotEmpty) {
      List<DeviceJsonDb> result =
          maps.map((p) => DeviceJsonDb.fromMap(p)).toList();
      return result;
    }
    return [];
  }

  Future<DeviceDb> insertDevice(DeviceDb dv) async {
    dv.id = await database.insert(tableDv, dv.toMap());
    // product.id = await database.rawInsert("INSERT Into ....");
    return dv;
  }

  // Future<int> updateLg(DeviceDb ie) async {
  //   return await database.update(
  //     TABLE_IE,
  //     ie.toMap(),
  //     where: "$columnId = ?",
  //     whereArgs: [ie.id],
  //   );
  // }

  Future<int> deleteIe(int id) async {
    return await database
        .delete(tableDv, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    return await database.rawDelete('DELETE FROM $tableDv ', []);
  }
}
