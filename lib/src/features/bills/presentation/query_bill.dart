import 'package:flutter/material.dart';
import 'package:sadad_poc/application.dart';

/// The QueryBill screen
@reflector
class QueryBill extends StatelessWidget {
  /// Constructs a [QueryBill]
  const QueryBill({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Query Bill')),
      body: const Center(
        child: Text('This is Query Bill Screen.'),
      ),
    );
  }
}
