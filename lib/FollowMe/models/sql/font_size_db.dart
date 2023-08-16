const String tableFs = 'fontsize';
const String columnId = 'id';
const String columnFs = 'fs';

class FontSizeDb {
  int? id;
  String? fs;

  FontSizeDb();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnFs: fs,
    };

    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  FontSizeDb.fromMap(Map<dynamic, dynamic> map) {
    id = map[columnId];
    fs = map[columnFs];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "fs": fs,
      };
  @override
  String toString() => "$id, $fs";
}
