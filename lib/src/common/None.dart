import 'package:flutter/material.dart';
import 'package:sadad_poc/application.dart';

/// The RejectedBill screen
@reflector
class None extends StatelessWidget {
  /// Constructs a [None]
  const None({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen NONE')),
      body: const Center(
        child: Text('This screen is not designed yet.'),
      ),
    );
  }
}
