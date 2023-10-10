import 'dart:io';

import 'package:mwasc/FollowMe/models/sql/user_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBUser {
  late Database database;

  Future<bool> initDB() async {
    try {
      const String dbName = 'UserDb.db';
      final String dbPath = await getDatabasesPath();
      final String path = join(dbPath, dbName);

      if (!await Directory(dirname(path)).exists()) {
        await Directory(dirname(path)).create(recursive: true);
      } else {}
      database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          String sql = "CREATE TABLE $tableUsername ("
              "$columnId INTEGER PRIMARY KEY,"
              "$columnUser TEXT,"
              "$columnPassword TEXT"
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

  Future<List<UserDb>> getUsers() async {
    List<Map> maps = await database.query(
      tableUsername,
      columns: [columnId, columnUser, columnPassword],
    );
    if (maps.isNotEmpty) {
      return maps.map((p) => UserDb.fromMap(p)).toList();
    }
    return [];
  }

  Future<UserDb> insertUsers(UserDb users) async {
    users.id = await database.insert(tableUsername, users.toMap());
    return users;
  }

  Future<int> updateUsers(UserDb users) async {
    return await database.update(
      tableUsername,
      users.toMap(),
      where: "$columnId = ?",
      whereArgs: [users.id],
    );
  }

  Future<int> deleteAll() async {
    return await database.rawDelete('DELETE FROM $tableUsername ', []);
  }
}
