import 'package:flutter/material.dart';

import '../../services/firebase/firestore_db.dart ';
import 'inventory_item_card_layout.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key}) : super(key: key);

  callback(snapshot, index) {
    debugPrint(" finding page callback");
  }

  @override

  /// Builds the search item page with a search input and a list of inventory items.
  ///
  /// This widget provides a search interface for finding and adding products
  /// to the inventory list. It displays a search text field, inventory items,
  /// and a floating action button to navigate to the add item page.
  Widget build(BuildContext context) {
    FireStoreDB db = FireStoreDB();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Products'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to the add item page with the database instance
          Navigator.pushNamed(context, '/addItem', arguments: db);
        },
        icon: const Icon(Icons.add_shopping_cart_rounded),
        label: const Text("Add Item to inventory list"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Column(
          children: [
            // Text field for searching shopping items
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Search Shopping Items to Add',
                prefixIcon: Icon(Icons.search_rounded),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Pick a Cat of the shopping item';
                }
                return null;
              },
              onSaved: (value) {
                // Save the value if needed
              },
            ),
            // Display the inventory items using a custom card layout
            Expanded(child: card_layout(db: db)),
          ],
        ),
      ),
    );
  }
}

class card_layout extends StatelessWidget {
  const card_layout({
    super.key,
    required this.db,
  });

  final FireStoreDB db;

  @override

  /// Build the widget tree based on the data from the database.
  ///
  /// If the data is loaded, display it in a ListView with a custom card layout.
  /// If the data is not loaded, display a CircularProgressIndicator.
  /// If there is an error, display a Text widget with the error message.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: db.readAllInventoryList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Display the data in a ListView with a custom card layout
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return inventoryItemCardLayout(context, snapshot, index, db);
              },
            );
          } else if (snapshot.hasError) {
            // Display an error message
            debugPrint("Loading shopping list data =>${snapshot.error}");
            return (const Center(child: Text('Something Went wrong')));
          } else {
            // Display a CircularProgressIndicator
            return (const Center(child: CircularProgressIndicator()));
          }
        });
  }
}
