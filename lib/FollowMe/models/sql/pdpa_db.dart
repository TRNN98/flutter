const String tablePdpa = 'pdpa';
const String columnId = 'id';
const String columnPdpa = 'pdpa';

class PdpaDb {
  int? id;
  String? pdpa;

  PdpaDb();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnPdpa: pdpa,
    };

    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  PdpaDb.fromMap(Map<dynamic, dynamic> map) {
    id = map[columnId];
    pdpa = map[columnPdpa];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "pdpa": pdpa,
      };
  @override
  String toString() => "$id, $pdpa";
}
