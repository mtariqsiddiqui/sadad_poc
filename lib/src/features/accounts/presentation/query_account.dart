import 'package:flutter/material.dart';
import 'package:sadad_poc/application.dart';

/// The QueryAccount screen
@appRoute
class QueryAccount extends StatelessWidget {
  /// Constructs a [QueryAccount]
  const QueryAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Query Account')),
      body: const Center(
        child: Text('This is Query Account Screen.'),
      ),
    );
  }
}
