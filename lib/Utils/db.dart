
import 'package:mysql1/mysql1.dart';

import '../models/UserModel.dart';
var _conn;


Future<void> connect() async {
  var settings = new ConnectionSettings(
      host: '10.0.2.2',
      port: 3306,
      user: 'root',
      db: 'sara12'
  );
  _conn = await MySqlConnection.connect(settings);
  return _conn;
}

Future<void> showUsers() async {

  connect();

  // Query the database using a parameterized query
  var results = await _conn.query(
    'select * from users',);
  for (var row in results) {
    print('userID: ${row[0]}, firstName: ${row[1]}, lastName: ${row[2]}, password: ${row[3]}, Email: ${row[4]}');
  }
}


Future<void> insertUser(User user) async {

  connect();
  // _conn = connect();


  var result = await _conn.query(
      'insert into users (firstName, lastName, password, Email, userName) values (?, ?, ?, ?, ?)',
      [user.firstName, user.lastName, user.password, user.Email, user.username ]);
  print('Inserted row id=${result.insertId}');
  // Finally, close the connection
  await _conn.close();

}
Future<Results> checkLogIn(Email , password) async {
  connect();
  print(("checklooogin"));
  var result = await _conn.query(
      'select * from users where Email=? and password=?',
      [Email , password]);
  print('check logIn row id=${Results}');
  await _conn.close();
  return result;
}