import 'package:flutter/material.dart';
import 'package:user_profiler/display_data/back/entry.dart';
import 'package:user_profiler/services/db/database.dart';
import 'package:user_profiler/services/html_parser/html_parser.dart';
import 'package:user_profiler/display_data/back/entry.dart';

class DisplayDataVM extends ChangeNotifier {
  HtmlParser htmlParser = HtmlParser();
  Db database = Db();
  List<Person>? entries ;
  List<String> loadedPage = [];

  Future<void> addEntry(
      String name, String weekday, String time, String text) async {
    database.insertData(name, weekday, time, text);
  }

  Future<void> createTable() async {
    database.createTable();
  }

  Future<void> loadPage() async {
    await htmlParser.convertIntoDocument(addEntry);
  }

  Future<void> showData() async {
    List<Map<String, Object?>> data = [];
    List<Person> list = [];
    data.add({'firstName' :'firstname', 'lastName' : 'lastname', 'age': 1});

    for (var el in data) {
      var entry = Person.fromJson(el);
      list.add(entry);
    }

    entries = list;
    notifyListeners();
  }
}
