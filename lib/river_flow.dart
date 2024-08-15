import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final riverpodEasyLevel = StateProvider<String>((ref) {
  return String.fromCharCode(Random().nextInt(100));
});

// final riverpodHardLevel = ChangeNotifierProvider(_createFn)