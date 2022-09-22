// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Entry _$$_EntryFromJson(Map<String, dynamic> json) => _$_Entry(
      id: json['id'] as int,
      userName: json['userName'] as String,
      weekDay: json['weekDay'] as String,
      postTime: json['postTime'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$_EntryToJson(_$_Entry instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'weekDay': instance.weekDay,
      'postTime': instance.postTime,
      'text': instance.text,
    };
