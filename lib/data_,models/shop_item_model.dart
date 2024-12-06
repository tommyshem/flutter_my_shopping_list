// shopping item data model

import 'package:cloud_firestore/cloud_firestore.dart';

class ShopItem {
// constructor
  ShopItem({
    this.id,
    required this.name,
    this.dateAdded,
    this.price,
    required this.qty,
    this.storeLocation,
    this.store,
    this.barcode,
    this.cat,
    this.comments,
    this.dateLastAdded,
    this.soldIn,
    this.person,
    this.userImagePath,
    this.timesBought,
  });

  factory ShopItem.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ShopItem(
      id: document.id,
      name: data["name"] as String,
      dateAdded: data["dateAdded"] as String?,
      price: data["price"] as double?,
      //  qty: data["qty"] != null ? int?.parse(data['qty']) : 0,
      qty: data["qty"] as int?,
      storeLocation: data["storeLocation"] as String?,
      store: data["store"] as String?,
      cat: data["cat"] as String?,
      barcode: data["barcode"] as String?,
      soldIn: data["soldIn"] as String?,
      dateLastAdded: data["dateLastAdded"] as String?,
      comments: data["comments"] as String?,
      person: data["person"] as String?,
      userImagePath: data["userImagePath"] as String?,
      timesBought: data["timesBought"] as int?,
    );
  }

  String? barcode;
  String? cat;
  String? comments;
  String? dateAdded;
  String? dateLastAdded;
  String? id;
  String name;
  String? person;
  double? price;
  int? qty;
  String? soldIn;
  String? store;
  String? storeLocation;
  String? userImagePath;
  int? timesBought;

  @override
  String toString() {
    return ' id: $id, Name: $name \n dateAdded: $dateAdded, price $price \n qty: $qty, storeLocation: $storeLocation \n store: $store, cat: $cat \n barcode: $barcode, soldIn: $soldIn \n dateLastAdded: $dateLastAdded comments: $comments \n person $person \n userImagePath $userImagePath \n timesBought $timesBought \n';
  }

  // to json so it can be uploaded to the firebase database
  toJson() {
    return {
      'id': id,
      'name': name,
      'dataAdded': dateAdded,
      // ignore: unnecessary_cast
      'price': price as double?,
      'qty': qty as int,
      'storeLocation': storeLocation,
      'store': store,
      'cat': cat,
      'barcode': barcode,
      'soldIn': soldIn,
      'dataLastAdded': dateLastAdded,
      'comments': comments,
      'person': person,
      'userImagePath': userImagePath,
      'timesBought': timesBought,
    };
  }
}
