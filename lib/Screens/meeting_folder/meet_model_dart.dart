const String tableMeeting = 'meetings';

class MeetingFields {
  static final List<String> values = [
    /// Add all fields
    id, title, date, time, myContact, createdBy,
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String date = 'date';
  static const String time = 'time';
  static const String myContact = 'myContact';
  static const String createdBy = 'createdBy';
}

class Meeting {
  final int? id;
  final String title;
  final String date;
  final String time;
  final String myContact;
  final String createdBy;

  const Meeting({
    this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.myContact,
    required this.createdBy,
  });

  Meeting copy({
    int? id,
    String? title,
    String? date,
    String? time,
    String? myContact,
    String? createdBy,
  }) =>
      Meeting(
        id: id ?? this.id,
        title: title ?? this.title,
        date: date ?? this.date,
        time: time ?? this.time,
        myContact: myContact ?? this.myContact,
        createdBy: createdBy ?? this.createdBy,
      );

  static Meeting fromJson(Map<String, Object?> json) => Meeting(
        id: json[MeetingFields.id] as int?,
        title: json[MeetingFields.title] as String,
        date: json[MeetingFields.date] as String,
        time: json[MeetingFields.time] as String,
        myContact: json[MeetingFields.myContact] as String,
        createdBy: json[MeetingFields.createdBy] as String,
      );

  Map<String, Object?> toJson() => {
        MeetingFields.id: id,
        MeetingFields.title: title,
        MeetingFields.date: date,
        MeetingFields.time: time,
        MeetingFields.myContact: myContact,
        MeetingFields.createdBy: createdBy,
      };
}
