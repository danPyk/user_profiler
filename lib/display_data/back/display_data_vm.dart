import 'package:flutter/material.dart';
import 'package:user_profiler/services/db/database.dart';
import 'package:user_profiler/services/html_parser/html_parser.dart';



class DisplayDataVM extends ChangeNotifier{
  HtmlParser htmlParser = HtmlParser();
  Db database = Db();

   String loadedPage = '';


   Future<void> addEntry() async{
     database.insertData();
   }
 Future<void> createTable() async{
     database.createTable();
   }

  Future<String> loadPage() async{
    return await htmlParser.convertIntoDocument();
  }

  showData() {
    database.getData();

  }


}