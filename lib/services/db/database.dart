
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

late final Database database;
///1. przeklenstwa, 2. emotki

class Db {
  Future<dynamic> dbReference() async {
    final db = database;
    return db;
  }

  Future<String> dbPath() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'chat.db');
    return path;
  }

  Future<void> createTable() async {
    await database.execute(
        'CREATE TABLE Entries (id INTEGER PRIMARY KEY, userName TEXT, weekDay Date, postTime TEXT, text TEXT)');
  }

  Future<void> deleteDb() async {
    var path = await dbPath();

    await deleteDatabase(path);
  }

  Future<void> insertData(
      String name, String weekday, String time, String text) async {
    //todo try catch
    try {
      await database.transaction((txn) async {
        await txn.rawInsert(
            'INSERT INTO Entries(userName, weekday, postTime, text) VALUES("$name", "$weekday", "$time", "$text")');
      });
    } catch (e) {
      var logger = Logger();
      logger.e("insertData error");
    }
  }

  Future<void> closeDb() async {
    await database.close();
  }



  Future<List<Map<String, Object?>>> getAllData() async {
    List<Map<String, Object?>> list =
        await database.rawQuery('SELECT * FROM Entries');

    return list;
  }
  ///parts - user exit, join - arrived
  Future<List<Map<String, Object?>>> getAllPartsOrJoins(String partsOrJoin, String userName) async {
    List<Map<String, Object?>> list =
        await database.rawQuery('SELECT * FROM Entries WHERE userName LIKE "$partsOrJoin: $userName" ');

    return list;
  }
  Future<List<Map<String, Object?>>> getAllUserEntries(String userName) async {
    List<Map<String, Object?>> list =
        await database.rawQuery('SELECT * FROM Entries WHERE userName == "$userName"');

    return list;
  }

  Future<List<Map<String, Object?>>> searchPhrase( String phrase) async {
    List<Map<String, Object?>> list =
    await database.rawQuery('SELECT * FROM Entries WHERE text LIKE "%$phrase%"  ');

    return list;
  }
  Future<List<Map<String, Object?>>> searchPhraseAndVariety( String phrase) async {
    List<Map<String, Object?>> list =
    await database.rawQuery('SELECT * FROM Entries WHERE text LIKE "%$phrase%"  ');

    return list;
  }
}
