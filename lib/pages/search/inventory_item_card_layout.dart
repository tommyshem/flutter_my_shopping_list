import 'package:flutter/material.dart';

import '../../data_,models/shop_item_model.dart';
import '../../services/firebase/firestore_db.dart ';

Card inventoryItemCardLayout(
  context,
  AsyncSnapshot<List<ShopItem>> snapshot,
  int index,
  FireStoreDB db,
) {
  return Card(
    color: Colors.greenAccent,
    child: Column(
      children: [
        ListTile(
          // qty
          leading: IconButton(
            icon: const Icon(Icons.add_box_rounded),
            tooltip: 'Add to shopping list',
            onPressed: () {
              debugPrint("add item pressed");
            },
          ),
          // shop item
          title: Text(
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            snapshot.data![index].name,
          ),
          // price
          subtitle: Text(
            textAlign: TextAlign.center,
            " ${snapshot.data![index].store != null ? snapshot.data![index].store!.toString() : ""}",
          ),
          // user
          trailing: IconButton(
            icon: const Icon(Icons.arrow_circle_right_rounded),
            tooltip: 'Add to shopping list',
            onPressed: () {
              debugPrint("more details  pressed");
            },
          ),
        ),
      ],
    ),
  );
}
