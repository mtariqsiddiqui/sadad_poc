import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadad_poc/application.dart';
import 'package:sadad_poc/main.reflectable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sadad_poc/src/utils/logger.dart';
import 'firebase_options.dart';

void main() async{
  initializeReflectable();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(observers:[Logger()], child: Application()));
}