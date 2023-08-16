const String tableDv = 'device';
const String columnId = 'id';
const String columnStatus = 'status';

class DeviceDb {
  int? id;
  String? status;

  DeviceDb();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnStatus: status,
    };

    // if (id != null) {
    //   map[columnId] = id;
    // }
    return map;
  }

  DeviceDb.fromMap(Map<dynamic, dynamic> map) {
    id = map[columnId];
    status = map[columnStatus];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
      };
// @override
// String toString() => "$id, $type,$description,$amount";

}

class DeviceJsonDb {
  int? id;
  String? status;

  DeviceJsonDb(this.id, this.status);

  DeviceJsonDb.fromMap(Map<dynamic, dynamic> map) {
    id = map[columnId];
    status = map[columnStatus];
  }

  Map<String, dynamic> toJson() => {"id": id, "status": status};

  @override
  String toString() => "IEJsonDb({$id, $status})";
}
