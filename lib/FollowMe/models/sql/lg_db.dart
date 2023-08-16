const String tableLg = 'lgs';
const String columnId = 'id';
const String columnLg = 'lg';

class LGDb {
  int? id;
  String? lg;

  LGDb({this.id, this.lg});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnLg: lg,
    };

    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  LGDb.fromMap(Map<dynamic, dynamic> map) {
    id = map[columnId];
    lg = map[columnLg];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "lg": lg,
      };
  @override
  String toString() => "$id, $lg";
}
