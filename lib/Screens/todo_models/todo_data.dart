
/*final String AppointTable = 'appointments';

class AppointFields {

  static final List<String> values = [
    // Add All Fields
    id, name, contact, datetime, reason
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
  final int contact;
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
    int? contact,
    String? datetime,
    String? reason,
  }) =>
      Appoint_Data(
        id: id ?? this.id,
        name: name ?? this.name,
        contact: contact ?? this.contact,
        datetime: datetime ?? this.datetime,
        reason: reason ?? this.reason,
      );

  static Appoint_Data fromJson(Map<String, Object?> json) => Appoint_Data(
    id: json[AppointFields.id] as int?,
    name: json[AppointFields.name] as String,
    contact: json[AppointFields.contact] as int,
    datetime: json[AppointFields.datetime] as String,
    reason: json[AppointFields.reason] as String,
  );


  Map<String, Object?> toJson() => {
    
      AppointFields.id : id,
      AppointFields.name : name,
      AppointFields.contact : contact,
      AppointFields.datetime : datetime,
      AppointFields.reason : reason,
      
    
  };

}
*/



final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, title, description, datetime,
  ];

  static final String id = '_id';
  static final String title = 'title';
  static final String datetime = 'datetime';
  static final String description = 'description';
}

class Note {
  final int? id;
  final String title;
  final String datetime;
  final String description;

  const Note({
    this.id,
    required this.title,
    required this.datetime,
    required this.description,
  });

  Note copy({
    int? id,
    String? title,
    String? datetime,
    String? description,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        datetime: datetime ?? this.datetime,
        description: description ?? this.description,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        title: json[NoteFields.title] as String,
        datetime: json[NoteFields.datetime] as String,
        description: json[NoteFields.description] as String,
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.datetime: datetime,
        NoteFields.description: description,
      };
}
