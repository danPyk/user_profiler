final String tableUserName = 'userName';
final String columnWeekDay = 'weekDay';
final String columnTime = 'postTime';

class Entry {
   final String userName ;
   final DateTime weekDay;
   final DateTime postTime;

   const Entry({required  this.userName, required this.weekDay, required this.postTime});

  // Entry.fromMap(Map<String, Object?> map){
  //
  //   userName = map[tableUserName] as String;
  //   weekDay = map[columnWeekDay] as DateTime;
  //   postTime = map[columnTime] as DateTime;
  //
  // }

   Map<String, dynamic> toMap() {
     return {
       'userName': userName,
       'weekDay': weekDay,
       'postTime': postTime,
     };
   }

   @override
  String toString() {
    return 'username $userName weekday $weekDay posttime $postTime';
  }
}