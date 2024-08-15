import 'package:flutter/material.dart';
import 'package:sadad_poc/application.dart';

/// The RejectedBill screen
@reflector
class RejectedBill extends StatelessWidget {
  /// Constructs a [RejectedBill]
  const RejectedBill({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rejected Bill')),
      body: const Center(
        child: Text('This is Rejected Bill Screen.'),
      ),
    );
  }
}
