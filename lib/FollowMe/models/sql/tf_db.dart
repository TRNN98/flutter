const String tableTf = 'touchandface';
const String columnId = 'id';
const String columnTf = 'tf';

class TFDb {
  int? id;
  String? tf;

  TFDb();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTf: tf,
    };

    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  TFDb.fromMap(Map<dynamic, dynamic> map) {
    id = map[columnId];
    tf = map[columnTf];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "tf": tf,
      };
  @override
  String toString() => "$id, $tf";
}
