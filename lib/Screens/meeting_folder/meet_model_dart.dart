const String tbName = 'meetings';

class MeetingFields {
  static final List<String> values = [
    /// Add all fields
    meetId, meetHeader, meetDate, meetTime, meetContact, createdBy,
  ];

  static const String meetId = '_id';
  static const String meetHeader = 'title';
  static const String meetDate = 'date';
  static const String meetTime = 'time';
  static const String meetContact = 'myContact';
  static const String createdBy = 'createdBy';
}

class Meeting {
  final int? meetId;
  final String meetHeader;
  final String meetDate;
  final String meetTime;
  final String meetContact;
  final String createdBy;

  const Meeting({
    this.meetId,
    required this.meetHeader,
    required this.meetDate,
    required this.meetTime,
    required this.meetContact,
    required this.createdBy,
  });

  Meeting copy({
    int? meetId,
    String? meetHeader,
    String? meetDate,
    String? meetTime,
    String? meetContact,
    String? createdBy,
  }) =>
      Meeting(
        meetId: meetId ?? this.meetId,
        meetHeader: meetHeader ?? this.meetHeader,
        meetDate: meetDate ?? this.meetDate,
        meetTime: meetTime ?? this.meetTime,
        meetContact: meetContact ?? this.meetContact,
        createdBy: createdBy ?? this.createdBy,
      );

  // static Meeting fromJson(Map<String, Object?> json) => Meeting(
  //       id: json[MeetingFields.id] as int?,
  //       title: json[MeetingFields.title] as String,
  //       date: json[MeetingFields.date] as String,
  //       time: json[MeetingFields.time] as String,
  //       myContact: json[MeetingFields.myContact] as String,
  //       createdBy: json[MeetingFields.createdBy] as String,
  //     );

  // Map<String, Object?> toJson() => {
  //       MeetingFields.id: id,
  //       MeetingFields.title: title,
  //       MeetingFields.date: date,
  //       MeetingFields.time: time,
  //       MeetingFields.myContact: myContact,
  //       MeetingFields.createdBy: createdBy,
  //     };

}
