
final String AppointTable = 'appointments';

class AppointFields {

  static final List<String> values = [
    // Add All Fields
    id, name, contact, datetime, reason,
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String contact = 'contact';
  static final String datetime = 'datetime';
  static final String reason = 'reason';

}


class Appoint_Data {
  
  final int? id;
  final String name;
  final String contact;
  final String datetime;
  final String reason;

  const Appoint_Data({
    this.id,
    required this.name,
    required this.contact,
    required this.datetime,
    required this.reason
  });

  Appoint_Data copy({
    int? id,
    String? name,
    String? contact,
    String? datetime,
    String? reason
  }) =>
      Appoint_Data(
        id: id ?? this.id,
        name: name ?? this.name,
        contact: contact ?? this.contact,
        datetime: datetime ?? this.datetime,
        reason: reason ?? this.reason
      );

  static Appoint_Data fromMap(Map<String, Object?> map) => Appoint_Data(
    id: map[AppointFields.id] as int?,
    name: map[AppointFields.name] as String,
    contact: map[AppointFields.contact] as String,
    datetime: map[AppointFields.datetime] as String,
    reason: map[AppointFields.reason] as String
  );


  Map<String, Object?> toMap() => {
    
      AppointFields.id : id,
      AppointFields.name : name,
      AppointFields.contact : contact,
      AppointFields.datetime : datetime,
      AppointFields.reason : reason
      
    
  };

}

