const String tableEmployee = 'employee';

class EmployeeFields {
  static final List<String> values = [
    /// Add all fields
    empid, empname, empcontact, empdestination,
  ];

  static const String empid = '_id';
  static const String empname = 'name';
  static const String empcontact = 'contact';
  static const String empdestination = 'destination';
}

class Employee {
  final int? empid;
  final String empname;
  final String empcontact;
  final String empdestination;

  const Employee({
    this.empid,
    required this.empname,
    required this.empcontact,
    required this.empdestination,
  });

  Employee copy({
    int? empid,
    String? empname,
    String? empcontact,
    String? empdestination,
  }) =>
      Employee(
        empid: empid ?? this.empid,
        empname: empname ?? this.empname,
        empcontact: empcontact ?? this.empcontact,
        empdestination: empdestination ?? this.empdestination,
      );

  static Employee fromJson(Map<String, Object?> json) => Employee(
        empid: json[EmployeeFields.empid] as int?,
        empname: json[EmployeeFields.empname] as String,
        empcontact: json[EmployeeFields.empcontact] as String,
        empdestination: json[EmployeeFields.empdestination] as String,
      );

  Map<String, Object?> toJson() => {
        EmployeeFields.empid: empid,
        EmployeeFields.empname: empname,
        EmployeeFields.empcontact: empcontact,
        EmployeeFields.empdestination: empdestination,
      };
}
