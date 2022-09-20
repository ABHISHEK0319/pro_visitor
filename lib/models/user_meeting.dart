class UserMeetingData {
  final int? id;
  final String title;
  late final String time;
  final String date;
  UserMeetingData({
    this.id,
    required this.title,
    required this.time,
    required this.date,
  });
  // String get _title => title;
  // String get _time => time;
  // String get _date => date;
  // set _title(String title) {
  //   _title = title;
  // }
  // set _time(String time) {
  //   _time = time;
  // }
  // set _date(String date) {
  //   _date = date;
  // }
  //to be used when inserting a row in the table
  Map<String, dynamic> toMapWithoutId() {
    final map = <String, dynamic>{};
    map["title"] = title;
    map["time"] = time;
    map["date"] = date;
    return map;
  }

  //to be used when updating a row in the table
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map["id"] = id;
    map["title"] = title;
    map["time"] = time;
    map["date"] = date;
    return map;
  }

  //to be used when converting the row into object
  factory UserMeetingData.fromMap(Map<String, dynamic> data) => UserMeetingData(
        id: data['id'],
        title: data["title"],
        time: data["time"],
        date: data["date"],
      );
}
