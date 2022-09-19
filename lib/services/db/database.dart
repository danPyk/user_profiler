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
        'CREATE TABLE Days (id INTEGER PRIMARY KEY, userName TEXT, weekDay Date, postTime TEXT)');
  }

  Future<void> insertData(String name, String weekday, String time, String text) async {
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Days(userName, weekday, postTime) VALUES($name, $weekday, $time, $text)');
    });
  }

  Future<void> closeDb() async {
    await database.close();
  }

  Future<List<Map<String, Object?>>>  getData() async {
    List<Map<String, Object?> > list = await database.rawQuery('SELECT * FROM Day');

    return list;
  }
}
