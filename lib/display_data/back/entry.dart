import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'entry.freezed.dart';

part 'entry.g.dart';

@freezed
class Entry with _$Entry {
  const factory Entry({
    required int id,
    required String userName,
    //todo date\

    required String weekDay,
    required String postTime ,
    required String text ,
  }) = _Entry;

  factory Entry.fromJson(Map<String, Object?> json)
  => _$EntryFromJson(json);
}