import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:html/parser.dart' show parse;
import 'package:logger/logger.dart';

class HtmlParser {
  Future<List<String>> loadAssets() async {
    List<String> list = [];

    DateTime dataTime = DateTime(2022, 04, 26);

    for (int i = 0; i <= 79; i++) {
      for (int i = 3; i <= 15; i++) {
        late String asset;

        ///add '0' before month less than 10
        if (dataTime.month < 10 && dataTime.day >= 10) {
          asset =
              'assets/pages/${dataTime.year}-0${dataTime.month}-${dataTime.day}+$i.txt';
        }
        ///add '0' before month and day less than 10 etc.
        if (dataTime.month < 10 && dataTime.day < 10) {
          asset =
              'assets/pages/${dataTime.year}-0${dataTime.month}-0${dataTime.day}+$i.txt';
        }

        if (dataTime.month >= 10 && dataTime.day >= 10) {
          asset =
              'assets/pages/${dataTime.year}-${dataTime.month}-${dataTime.day}+$i.txt';
        }
        if (dataTime.month >= 10 && dataTime.day < 10) {
          asset =
              'assets/pages/${dataTime.year}-${dataTime.month}-0${dataTime.day}+$i.txt';
        }
        try {
          list.add(await rootBundle.loadString(asset));
        } catch (on) {
          var logger = Logger();
          logger.d(on.toString());
        }
      }
      dataTime = dataTime.add(const Duration(days: 1));
    }

    return list;
  }

  Future<void> convertIntoDocument(
      Function(String date, String time, String user, String text)
          storeData) async {
    List<String> page = await loadAssets();

    for (var i = 0; i < page.length; ++i) {
      var document = parse(page[i]);
      var docLenght = document
          .querySelectorAll('table.table-striped.table-bordered > tbody > tr')
          .length;
      for (var i = 0; i < docLenght; ++i) {
        var date;
        var time;
        var user;
        var text = '';
        try {
          date = document
              .getElementsByClassName('fa fa-calendar-o')[0]
              .parentNode
              ?.text;
          time = document
              .getElementsByClassName('table table-striped table-bordered')[0]
              .children[1]
              .children[i]
              .children[0]
              .text;
          user = document
              .getElementsByClassName('table table-striped table-bordered')[0]
              .children[1]
              .children[i]
              .children[1]
              .text;

          text = document
              .getElementsByClassName('table table-striped table-bordered')[0]
              .children[1]
              .children[i]
              .children[2]
              .text;
        } catch (on) {}

        ///parts is in userName field
        storeData(user, date!, time, text);
        var logger = Logger(); logger.d("convertIntoDocument finished $date");
      }
    }
  }
}
