import 'dart:io';

import 'package:mwasc/FollowMe/models/sql/pdpa_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBPdpa {
  late Database database;

  Future<bool> initDB() async {
    try {
      const String dbName = 'PdpaDb.db';
      final String dbPath = await getDatabasesPath();
      final String path = join(dbPath, dbName);

      if (!await Directory(dirname(path)).exists()) {
        await Directory(dirname(path)).create(recursive: true);
      } else {}
      database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
            create table  $tablePdpa (
              $columnId  integer primary key ,
              $columnPdpa TEXT NOT NULL DEFAULT '0')
            ''');
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

  Future<List<PdpaDb>> getPdpa() async {
    List<Map> maps = await database.query(
      tablePdpa,
      columns: [columnId, columnPdpa],
    );
    if (maps.isNotEmpty) {
      return maps.map((p) => PdpaDb.fromMap(p)).toList();
    }
    return [];
  }

  Future<PdpaDb> insertPdpa(PdpaDb pdpa) async {
    pdpa.id = await database.insert(tablePdpa, pdpa.toMap());
    return pdpa;
  }

  Future<int> updatePdpa(PdpaDb pdpa) async {
    return await database.update(
      tablePdpa,
      pdpa.toMap(),
      where: "$columnId = ?",
      whereArgs: [pdpa.id],
    );
  }

  Future<int> deleteAll() async {
    return await database.rawDelete('DELETE FROM $tablePdpa ', []);
  }
}
