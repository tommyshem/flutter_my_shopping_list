import '../../services/firebase/firestore_db.dart%20';
import 'package:flutter/material.dart';
import '../data_,models/shop_item_model.dart';

class TestUi extends StatefulWidget {
  const TestUi({super.key});

  @override
  State<TestUi> createState() => _SignInState();
}

class _SignInState extends State<TestUi> {
  FireStoreDB db = FireStoreDB();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      //AppBar
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 68, 0),
        elevation: 0.0,
        title: const Text("Test page"),
      ),
      // body
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                ShopItem shopItem = ShopItem(name: "orange", price: 5, qty: 7);
                db.writeShoppingItem(shopItem);
              },
              child: const Text("Test Write database"),
            ),
            ElevatedButton(
              onPressed: () async {
                db.readAllShoppingList();
              },
              child: const Text("Test Read database"),
            ),
            ElevatedButton(
              onPressed: () async {
                //  db.findItem();
              },
              child: const Text("Test find database"),
            ),
          ],
        ),
      ),
    );
  }
}
