import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

typedef PageID = String;

@immutable
class Page extends Equatable {
  final PageID pageId;
  final int order;
  final String pageLabel;
  final String pagePermission;
  final String pageType;
  final String pageUrl;
  final String pageApplication;

  // Default Constructor
  const Page({required this.pageId, required this.order, required this.pageLabel, required this.pagePermission, required this.pageType, required this.pageUrl, required this.pageApplication});

  @override
  List<Object> get props => [pageId, order, pageLabel, pagePermission, pageType, pageUrl, pageApplication];

  @override
  bool get stringify => true;

  // Factory Constructor fromMap
  factory Page.fromMap(Map<String, dynamic> data, String id) {
    final order = data['order'] as int;
    final pageLabel = data['pageLabel'] as String;
    final pageType = data['pageType'] as String;
    final pagePermission = data['pagePermission'] as List<dynamic>;
    final pageUrl = data['pageUrl'] as String;
    final pageApplication = data['pageApplication'] as String;
    return Page(
      pageId: id,
      order: order,
      pageLabel: pageLabel,
      pagePermission: pagePermission.toString(),
      pageType: pageType,
      pageUrl: pageUrl,
      pageApplication: pageApplication
    );
  }

  // Factory Constructor fromMap
  Map<String, dynamic> toMap() {
    return {
      'order': order,
      'pageLabel': pageLabel,
      'pagePermission': pagePermission,
      'pageType': pageType,
      'pageUrl': pageUrl,
      'pageApplication': pageApplication
    };
  }
}
