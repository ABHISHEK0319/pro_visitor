import 'package:flutter/material.dart';

void main() => runApp(const Faqs());

class Faqs extends StatelessWidget {
  const Faqs({super.key});

  static const String _title = 'FAQs';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: SingleChildScrollView(
          child: Center(
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text("FAQs",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      '''
          1. What is your return policy?
          2. When will I get my refund?
          3. How do I track my order?


          4. Getting Started
          5. Payments and Billing
          6. Troubleshooting


                     ''',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
