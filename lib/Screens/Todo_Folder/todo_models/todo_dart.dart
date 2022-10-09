const String tableNotes = 'Todo_Record';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    todoid, todotitle, tododescription, tododatetime,
  ];

  static const String todoid = 'TodoId';
  static const String todotitle = 'TodoTitle';
  static const String tododatetime = 'TodoDatetime';
  static const String tododescription = 'TodoDescription';
}

class Note {
  final int? todoid;
  final String todotitle;
  final String tododatetime;
  final String tododescription;

  const Note({
    this.todoid,
    required this.todotitle,
    required this.tododatetime,
    required this.tododescription,
  });

  Note copy({
    int? todoid,
    String? todotitle,
    String? tododatetime,
    String? tododescription,
  }) =>
      Note(
        todoid: todoid ?? this.todoid,
        todotitle: todotitle ?? this.todotitle,
        tododatetime: tododatetime ?? this.tododatetime,
        tododescription: tododescription ?? this.tododescription,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        todoid: json[NoteFields.todoid] as int?,
        todotitle: json[NoteFields.todotitle] as String,
        tododatetime: json[NoteFields.tododatetime] as String,
        tododescription: json[NoteFields.tododescription] as String,
      );

  Map<String, Object?> toJson() => {
        NoteFields.todoid: todoid,
        NoteFields.todotitle: todotitle,
        NoteFields.tododatetime: tododatetime,
        NoteFields.tododescription: tododescription,
      };
}
