import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:user_profiler/display_data/back/entry.dart';
import 'package:user_profiler/services/db/database.dart';
import 'package:user_profiler/services/html_parser/html_parser.dart';
import 'package:user_profiler/display_data/back/entry.dart';

class DisplayDataVM extends ChangeNotifier {
  HtmlParser htmlParser = HtmlParser();
  Db database = Db();
  List<Entry> entries = [];

  List<String> loadedPage = [];

  Future<void> extractHtml() async {
    await htmlParser.convertIntoDocument(addEntry);

    var logger = Logger();
    logger.i("transferToSql finished");
  }

  Future<void> addEntry(
      String name, String weekday, String time, String text) async {
    database.insertData(name, weekday, time, text);
  }

  Future<void> printData() async {
    var data = await database.getAllData();
    print(data);
  }

  Future<void> printAssetsList() async {
    var data = await htmlParser.loadAssets();
    print(data.length.toString());
  }

  Future<void> convertToEntry(List<Map<String, Object?>> data) async {
    List<Entry> list = [];

    for (var el in data) {
      var entry = Entry.fromJson(el);
      list.add(entry);
    }

    entries = list;
    notifyListeners();
  }

  Future<void> getAllData() async {
    List<Map<String, Object?>> data = await database.getAllData();

    convertToEntry(data);
  }

  Future<void> searchPhrase(String phrase) async {
    List<Map<String, Object?>> data = await database.searchPhrase(phrase);
    convertToEntry(data);
  }

  Future<void> getAllEntries() async {
    List<Map<String, Object?>> data =
        await database.getAllPartsOrJoins('Parts', 'Koxen');

    convertToEntry(data);
  }

  Future<void> getAllUserEntries(String userName) async {
    List<Map<String, Object?>> data =
        await database.getAllUserEntries(userName);

    convertToEntry(data);
  }
}
