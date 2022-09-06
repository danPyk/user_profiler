import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:html/parser.dart' show parse;
import 'package:sqflite/sqflite.dart';


class HtmlParser {
  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/pages/2021-09-24+3.txt');
  }

  Future<String> convertIntoDocument() async {
    String page = await loadAsset();

    var document = parse(page);
    var date = document.getElementsByClassName('fa fa-calendar-o');

    var table = document.getElementsByClassName('table table-striped table-bordered')[0].children[0];
    var table2 = document.getElementsByClassName('table table-striped table-bordered')[0].children[1].children[0].toString();
    var table3 = document.getElementsByClassName('table table-striped table-bordered')[0].children[1].children[1].classes.to;


    print(table2);
    print(table3);

    return page;
  }
}
