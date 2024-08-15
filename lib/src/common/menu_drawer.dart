import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sadad_poc/river_flow.dart';
import 'package:sadad_poc/src/common/empty_content.dart';
import 'package:sadad_poc/src/common/error_screen.dart';
import 'package:sadad_poc/src/constants/app_sizes.dart';
import 'package:sadad_poc/src/core/authorization/data/authorization_repository.dart';
import 'package:sadad_poc/src/core/authorization/domain/page.dart' as app_pages;

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class ApplicationDrawer<T> extends StatelessWidget {
  final AsyncValue<List<T>> data;

  const ApplicationDrawer({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return data.when(
      data: (items) => items.isNotEmpty
          ? Drawer(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final p = items[index] as app_pages.Page;
                  return ListTile(title: Text(p.pageLabel), onTap: () => context.go(p.pageUrl));
                },
              ),
            )
          : const EmptyContent(),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => EmptyContent(title: 'Error occurred!', message: 'Something went wrong while fetching the authorized pages.'),
    );
  }
}
