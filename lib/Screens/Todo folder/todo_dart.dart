const String tableNotes = 'Todo_Record';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, title, description, datetime,
  ];

  static const String id = 'id';
  static const String title = 'title';
  static const String datetime = 'datetime';
  static const String description = 'description';
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
