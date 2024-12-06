// card layout for the shopping items
import 'package:flutter/material.dart';

import '../../data_,models/shop_item_model.dart';
import '../../services/firebase/firestore_db.dart ';

shoppingItemCardLayout(context, AsyncSnapshot<List<ShopItem>> snapshot,
    int index, FireStoreDB db, callback) {
  return Center(
    child: Card(
      color: Colors.greenAccent,
      child: Column(
        children: [
          ListTile(
            // qty
            leading: Text(
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
                textScaleFactor: 2,
                snapshot.data![index].qty.toString()),
            // shop item
            title: Text(
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500),
                textScaleFactor: 1.5,
                snapshot.data![index].name),
            // price
            subtitle: Text(
                textAlign: TextAlign.center,
                "£ ${snapshot.data![index].price != null ? snapshot.data![index].price!.toStringAsFixed(2) : "0.00"}"),
            // user
            trailing: Image(image: AssetImage(db.userImagePath.toString())),
            onTap: () {
              //TODO: remove item from the database
              debugPrint(snapshot.data![index].toString());
              debugPrint("Index number -> $index");
            },
          ),
          // got it button
          ElevatedButton(
            onPressed: () {
              callback(snapshot, index);
            },
            child: const Text("Got It"),
          )
        ],
      ),
    ),
  );
}
