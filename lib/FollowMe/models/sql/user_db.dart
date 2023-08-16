const String tableUsername = 'username';
const String columnId = 'id';
const String columnUser = 'user';
const String columnPassword = 'password';

class UserDb {
  int? id;
  String? user;
  String? password;

  UserDb();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnUser: user,
      columnPassword: password,
    };

    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  UserDb.fromMap(Map<dynamic, dynamic> map) {
    id = map[columnId];
    user = map[columnUser];
    password = map[columnPassword];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "password": password,
      };
  @override
  String toString() => "$id, $user, $password";
}


// int id;
// String title;
// bool done;
//
// Map<String, Object?> toMap() {
//   var map = <String, Object?>{
//     columnTitle: title,
//     columnDone: done == true ? 1 : 0
//   };
//   if (id != null) {
//     map[columnId] = id;
//   }
//   return map;
// }
//
// Todo();
//
// Todo.fromMap(Map<String, Object?> map) {
// id = map[columnId];
// title = map[columnTitle];
// done = map[columnDone] == 1;
// }