import 'package:flutter/material.dart';
import 'package:sadad_poc/application.dart';

/// The RejectedAccount screen
@reflector
class RejectedAccount extends StatelessWidget {
  /// Constructs a [RejectedAccount]
  const RejectedAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rejected Account')),
      body: const Center(
        child: Text('This is Rejected Account Screen.'),
      ),
    );
  }
}
