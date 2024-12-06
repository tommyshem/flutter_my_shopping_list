import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, db, widget) {
  return AppBar(
    title: Text(widget.title),
    // action icons
    actions: <Widget>[
      IconButton(
        icon: const Icon(
          Icons.search,
          semanticLabel: 'search',
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/searchItem');
          debugPrint('Search button');
        },
      ),
      IconButton(
        icon: const Icon(
          Icons.sync_alt_rounded,
          semanticLabel: 'sync',
        ),
        onPressed: () {
          db.readAllShoppingList();
          debugPrint('sync button pressed');
        },
      ),
    ],
  );
}
