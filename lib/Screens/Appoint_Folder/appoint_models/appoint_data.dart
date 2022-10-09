const String appointTable = 'Appointments_Record';

class AppointFields {
  static final List<String> values = [
    // Add All Fields
    appointid, appointname, appointcontact, appointdatetime, appointreason,
  ];

  static const String appointid = 'AppointId';
  static const String appointname = 'AppointName';
  static const String appointcontact = 'AppointContact';
  static const String appointdatetime = 'AppointDatetime';
  static const String appointreason = 'AppointReason';
}

// ignore: camel_case_types
class Appoint_Data {
  final int? appointid;
  final String appointname;
  final String appointcontact;
  final String appointdatetime;
  final String appointreason;

  const Appoint_Data(
      {this.appointid,
      required this.appointname,
      required this.appointcontact,
      required this.appointdatetime,
      required this.appointreason});

  Appoint_Data copy(
          {int? appointid,
          String? appointname,
          String? appointcontact,
          String? appointdatetime,
          String? appointreason}) =>
      Appoint_Data(
          appointid: appointid ?? this.appointid,
          appointname: appointname ?? this.appointname,
          appointcontact: appointcontact ?? this.appointcontact,
          appointdatetime: appointdatetime ?? this.appointdatetime,
          appointreason: appointreason ?? this.appointreason);

  static Appoint_Data fromJson(Map<String, Object?> json) => Appoint_Data(
      appointid: json[AppointFields.appointid] as int?,
      appointname: json[AppointFields.appointname] as String,
      appointcontact: json[AppointFields.appointcontact] as String,
      appointdatetime: json[AppointFields.appointdatetime] as String,
      appointreason: json[AppointFields.appointreason] as String);

  Map<String, Object?> toJson() => {
        AppointFields.appointid: appointid,
        AppointFields.appointname: appointname,
        AppointFields.appointcontact: appointcontact,
        AppointFields.appointdatetime: appointdatetime,
        AppointFields.appointreason: appointreason
      };
}
