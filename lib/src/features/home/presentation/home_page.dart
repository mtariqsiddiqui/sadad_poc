import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadad_poc/river_flow.dart';
import 'package:sadad_poc/src/common/menu_drawer.dart';
import 'package:sadad_poc/src/core/authorization/application/authorization_service.dart';
import 'package:sadad_poc/src/core/authorization/data/authorization_repository.dart';

class HomePage extends ConsumerWidget {
  String _selectedOption = 'Home Page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title: Text(widget.title),
        title: Text('Home Page'),
        leading: Builder(
          builder: (context) {
            return const DrawerButton();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_selectedOption, style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      drawer: Consumer(
        builder: (context, ref, child) {
          final pagesStream = ref.watch(pagesTileModelStreamProvider);
          return ApplicationDrawer(data: pagesStream);
        },
      ),
    );
  }
}
