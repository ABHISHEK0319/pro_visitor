import 'package:flutter/material.dart';

const String tableCalendar = 'Calendar_Record';

class CalendarFields {
  static final List<String> values = [
    /// Add all fields
    calId, calTitle, from, to, isAllDay,
    // calDesId,
  ];

  static const String calId = 'CalId';
  static const String calTitle = 'CalTitle';
  static const String from = 'Form';
  static const String to = 'To';
  //static const String calDesId = "calDesId";
  static const String isAllDay = "isAllDay";
}

class Event {
  final int? calId;
  final String calTitle;
  // final int calDesId;
  final DateTime from;
  final DateTime to;
  Color? backgroundColor;
  final bool isAllDay;

  Event({
    this.calId,
    required this.calTitle,
    // required this.calDesId,
    required this.from,
    required this.to,
    this.backgroundColor = Colors.redAccent,
    this.isAllDay = false,
  });

  Event copy({
    int? calId,
    String? calTitle,
    DateTime? from,
    DateTime? to,
    // int? calDesId,
    bool? isAllDay,
  }) =>
      Event(
          calId: calId ?? this.calId,
          calTitle: calTitle ?? this.calTitle,
          from: from ?? this.from,
          to: to ?? this.to,
          // calDesId: calDesId ?? this.calDesId,
          isAllDay: isAllDay ?? this.isAllDay);

  static Event fromJson(Map<String, Object?> json) => Event(
        calId: json[CalendarFields.calId] as int?,
        calTitle: json[CalendarFields.calTitle] as String,
        from: json[CalendarFields.from] as DateTime,
        to: json[CalendarFields.to] as DateTime,
        // calDesId: json[CalendarFields.calDesId] as int,
        isAllDay: json[CalendarFields.isAllDay] as bool,
      );

  Map<String, Object?> toJson() => {
        CalendarFields.calId: calId,
        CalendarFields.calTitle: calTitle,
        CalendarFields.from: from.toIso8601String(),
        CalendarFields.to: to.toIso8601String(),
        // CalendarFields.calDesId: calDesId,
        CalendarFields.isAllDay: isAllDay.toString(),
      };
}
