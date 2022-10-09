const String meetingTable = 'Meetings_Record';

class MeetingFields {
  static final List<String> values = [
    /// Add all fields
    meetId, meetTitle, meetDate, meetTime, meetContact, createdBy,
  ];

  static const String meetId = 'MeetId';
  static const String meetTitle = 'MeetTitle';
  static const String meetDate = 'MeetDate';
  static const String meetTime = 'MeetTime';
  static const String meetContact = 'MeetContact';
  static const String createdBy = 'CreatedBy';
}

class Meeting {
  final int? meetId;
  final String meetTitle;
  final String meetDate;
  final String meetTime;
  final String meetContact;
  final String createdBy;

  const Meeting({
    this.meetId,
    required this.meetTitle,
    required this.meetDate,
    required this.meetTime,
    required this.meetContact,
    required this.createdBy,
  });

  Meeting copy({
    int? meetId,
    String? meetTitle,
    String? meetDate,
    String? meetTime,
    String? meetContact,
    String? createdBy,
  }) =>
      Meeting(
        meetId: meetId ?? this.meetId,
        meetTitle: meetTitle ?? this.meetTitle,
        meetDate: meetDate ?? this.meetDate,
        meetTime: meetTime ?? this.meetTime,
        meetContact: meetContact ?? this.meetContact,
        createdBy: createdBy ?? this.createdBy,
      );

  static Meeting fromJson(Map<String, Object?> json) => Meeting(
        meetId: json[MeetingFields.meetId] as int?,
        meetTitle: json[MeetingFields.meetTitle] as String,
        meetDate: json[MeetingFields.meetDate] as String,
        meetTime: json[MeetingFields.meetTime] as String,
        meetContact: json[MeetingFields.meetContact] as String,
        createdBy: json[MeetingFields.createdBy] as String,
      );

  Map<String, Object?> toJson() => {
        MeetingFields.meetId: meetId,
        MeetingFields.meetTitle: meetTitle,
        MeetingFields.meetDate: meetDate,
        MeetingFields.meetTime: meetTime,
        MeetingFields.meetContact: meetContact,
        MeetingFields.createdBy: createdBy,
      };

}
