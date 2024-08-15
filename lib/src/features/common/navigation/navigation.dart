

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget _getListView() {
  final List<String> items = List<String>.generate(8, (i) => '$i');

  // ListView(
  //   padding: EdgeInsets.zero,
  //   children: [
  //     const DrawerHeader(child: Text('Navigation Menu')),

  return ListView.builder(
    padding: EdgeInsets.zero,
    itemCount: items.length,
    itemBuilder: (context, index) {
      return
        // DrawerHeader(child: Text('Navigation Menu'))
        ListTile(
          title: Text('Item ${items[index]}'),
          onTap: () {
            // context.set
            // // _navigationTapped('${items[index]}');
            // setState(() {
            //   _selectedOption = o;
            // });
            Navigator.pop(context);
          },
        );
    },
  );
}

