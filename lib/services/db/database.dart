import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

late final Database database;

class Db {
  Future<dynamic> dbReference() async {
    final db = await database;
    return db;
  }

  Future<void> createTable() async {
    await database.execute(
        'CREATE TABLE Day (id INTEGER PRIMARY KEY, userName TEXT, weekDay Date, postTime Time)');
  }

  Future<void> insertData() async {
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Day(userName, weekday, postTime) VALUES("somename", 24-24-20, "20:20:20")');
    });
  }

  Future<void> closeDb() async {
    await database.close();
  }

  Future<void> getData() async {
    List<Map> list = await database.rawQuery('SELECT * FROM Day');

    print(list);
  }
}
