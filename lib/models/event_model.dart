import 'package:flutter/material.dart';

const String tableCalendar = 'Calendar_Record';

class CalendarFields {
  static final List<String> values = [
    /// Add all fields
    calId, calTitle, calDescription, from, to, isAllDay,
  ];

  static const String calId = 'CalId';
  static const String calTitle = 'CalTitle';
  static const String from = 'Form';
  static const String to = 'To';
  static const String calDescription = "CalDescription";
  static const String isAllDay = "isAllDay";
}

class Event {
  final int? calId;
  final String calTitle;
  final String calDescription;
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;
  final bool isAllDay;

  const Event({
    this.calId,
    required this.calTitle,
    required this.calDescription,
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
    String? calDescription,
    bool? isAllDay,
  }) =>
      Event(
          calId: calId ?? this.calId,
          calTitle: calTitle ?? this.calTitle,
          from: from ?? this.from,
          to: to ?? this.to,
          calDescription: calDescription ?? this.calDescription,
          isAllDay: isAllDay ?? this.isAllDay);

  static Event fromJson(Map<String, Object?> json) => Event(
        calId: json[CalendarFields.calId] as int?,
        calTitle: json[CalendarFields.calTitle] as String,
        from: json[CalendarFields.from] as DateTime,
        to: json[CalendarFields.to] as DateTime,
        calDescription: json[CalendarFields.calDescription] as String,
        isAllDay: json[CalendarFields.isAllDay] as bool,
      );

  Map<String, Object?> toJson() => {
        CalendarFields.calId: calId,
        CalendarFields.calTitle: calTitle,
        CalendarFields.from: from,
        CalendarFields.to: to,
        CalendarFields.calDescription: calDescription,
        CalendarFields.isAllDay: isAllDay,
      };
}
