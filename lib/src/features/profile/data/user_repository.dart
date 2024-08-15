
class User {
  String userName, password;
  User(this.userName, this.password);
}

class UserRepository {
  Map<String, User> users = <String, User>{};
  UserRepository() {
    if (users.isEmpty) {
      users.putIfAbsent('tariq', () => User('tariq', 'secret1'));
      users.putIfAbsent('sahir', () => User('sahir', 'secret2'));
      users.putIfAbsent('khalid', () => User('khalid', 'secret3'));
    }
  }

  bool authenticate(User u) {
    if (users.isEmpty) {
      return false;
    } else if (users.containsKey(u.userName)) {
      return u.password == users[u.userName]?.password;
    } else {
      return false;
    }
  }
}

// void main() {
//   var ur = UserRepository();
//   var u = User('khalid', 'secret3');
//   print(ur.authenticate(u));
// }