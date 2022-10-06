import 'package:flutter/material.dart';

import '../db/database.dart';

class TesttPage extends StatefulWidget {
  const TesttPage({Key? key}) : super(key: key);

  @override
  State<TesttPage> createState() => _TesttPageState();
}

class _TesttPageState extends State<TesttPage> {
  int i = 10;

  @override
  void initState() async {
    super.initState();
    i = await insert();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(i.toString()),
    );
  }

  Future<int> insert() async {
    final db = await DbHelper.instance.getDatabase;
    List<Map<String, dynamic>> lastId = await DbHelper.querySpecific(
        "SELECT IFNULL(MAX(meetId), 0) AS LastId FROM Meeting_Record");
    String x = lastId.asMap().values.toList()[0].toString();
    RegExp re = RegExp(r'[^0-9]', caseSensitive: false, multiLine: false);
    var result = re.allMatches(x);
    // final i = int.parse(lastId[0].map().toString());

    final h = int.parse(result.toString());
    print(h);
    return (h);
  }
}
