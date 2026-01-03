import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data_,models/shop_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FireStoreDB {
  // database
  final _fireStoreDB = FirebaseFirestore.instance;
  // shopping List
  final List<ShopItem> _shoppingItems = [];
  // firestore collection name for shopping list
  final String _shoppingList = "shopping_list";
  final String _inventoryList = "inventory_list";
  String userName = "";
  String userImagePath = "";

  FireStoreDB() {
    // allow offline data
    _fireStoreDB.settings = const Settings(persistenceEnabled: true);
  }

  String getUserName() {
    return userName;
  }

  void setUserName(String user) {
    userName = user;
  }

  // shopping List table functions below

  Future<List<ShopItem>> readAllShoppingList() async {
    final snapshot = await _fireStoreDB.collection(_shoppingList).get();
    final shoppingItemsList = snapshot.docs
        .map((e) => ShopItem.fromSnapshot(e))
        .toList();
    _shoppingItems.clear();
    _shoppingItems.addAll(shoppingItemsList);
    debugPrint("readallshoppinglist function called");
    return _shoppingItems;
  }

  int getShoppingListLength() {
    debugPrint("shopping list length => ${_shoppingItems.length}");
    return _shoppingItems.length;
  }

  ShopItem getShoppingItemAtIndex(int index) {
    return _shoppingItems[index];
  }

  void deleteShoppingItem(String item) {
    deleteItem(item, _shoppingList);
  }

  void deleteItem(String item, String collectionName) {
    _fireStoreDB
        .collection(collectionName)
        .doc(item)
        .delete()
        .then(
          (doc) => debugPrint("Document deleted"),
          onError: (e) => debugPrint("Error updating document ${e.toString()}"),
        );
  }

  Future<ShopItem> findShoppingItem(String name) async {
    final snapshot = await _fireStoreDB
        .collection(_shoppingList)
        .where("name", isEqualTo: name)
        .get();
    final shoppingItem = snapshot.docs
        .map((e) => ShopItem.fromSnapshot(e))
        .single;
    return shoppingItem;
  }

  void addShoppingItem(ShopItem shopItem) {
    writeShoppingItem(shopItem);
  }

  void writeShoppingItem(ShopItem shopItem) {
    _fireStoreDB
        .collection(_shoppingList)
        .add(shopItem.toJson())
        .then(
          (DocumentReference doc) => debugPrint(
            'Shopping Item - DocumentSnapshot added with ID: ${doc.id}',
          ),
        )
        .onError((error, stackTrace) => debugPrint(error.toString()));
  }

  // items table functions below
  Future<List<ShopItem>> readAllInventoryList() async {
    final snapshot = await _fireStoreDB.collection(_inventoryList).get();
    final shoppingItemsList = snapshot.docs
        .map((e) => ShopItem.fromSnapshot(e))
        .toList();
    return shoppingItemsList;
  }

  void writeInventoryItem(ShopItem shopItem) {
    _fireStoreDB
        .collection(_inventoryList)
        .add(shopItem.toJson())
        .then(
          (DocumentReference doc) =>
              debugPrint('DocumentSnapshot added with ID: ${doc.id}'),
        );
  }

  void findInventoryItem() {
    // Create a reference to the cities collection
    final itemsRef = _fireStoreDB.collection(_inventoryList);

    // Create a query against the collection.
    itemsRef
        .where("name", isEqualTo: "orange")
        .get()
        .then(
          (res) => {
            for (var doc in res.docs)
              {debugPrint("${doc.id} => ${doc.data()}")},
          },
          onError: (e) => debugPrint("Error completing: ${e.toString()}"),
        );
  }

  void deleteInventoryItem(String item) {
    deleteItem(item, _inventoryList);
  }
}
