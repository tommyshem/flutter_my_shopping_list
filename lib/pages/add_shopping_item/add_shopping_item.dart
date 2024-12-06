import '../../data_,models/shop_item_model.dart';
import '../../services/firebase/firestore_db.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class AddShoppingItem extends StatefulWidget {
  const AddShoppingItem({super.key});

  @override
  State<AddShoppingItem> createState() => _AddShoppingItemState();
}

class _AddShoppingItemState extends State<AddShoppingItem> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedValue = "Each";
  final ShopItem _shopItem = ShopItem(name: "", qty: 1);
  // TODO: use database to store the choices
  final _soldInList = ["Box", "Bag", "Bottle", "Each", "Pack"];

  void snackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('Shopping Item Saved'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  fabPressed(BuildContext context) {
    debugPrint("add shopping item page fab button pressed");
    // get database instance passed in from home page
    final db = ModalRoute.of(context)!.settings.arguments as FireStoreDB;

    debugPrint("args => $db");
    if (_formKey.currentState!.validate()) {
      final now = DateTime.now();
      _shopItem.dateAdded = now.toString();
      _shopItem.person = db.getUserName();
      _shopItem.userImagePath = db.userImagePath;
      _formKey.currentState!.save();
      debugPrint(_shopItem.toString());
      db.addShoppingItem(_shopItem);
      snackbar(context);

      Navigator.pop(context);
    } else {
      debugPrint("Not validated");
    }
  }

  SingleChildScrollView addItemForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // ************** name ********************
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: const InputDecoration(
                  labelText: "Item Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.shopping_basket_outlined),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Item name is required';
                  }
                  return null;
                },
                onSaved: (value) {
                  _shopItem.name = value.toString();
                  debugPrint("Name in value => $value");
                },
              ),
              const SizedBox(height: 20),
              // ************* qty ********************
              TextFormField(
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                initialValue: "1",
                keyboardType: TextInputType.number,
                onFieldSubmitted: (String value) {},
                decoration: const InputDecoration(
                  labelText: "Qty",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.add_shopping_cart_rounded),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Qty is required';
                  } else if (int.tryParse(value) != null) {
                    return null;
                  }
                  return 'Qty not valid';
                },
                onSaved: (value) {
                  _shopItem.qty = int.tryParse(value!);
                  debugPrint("Qty in value => $value");
                },
              ),
              const SizedBox(height: 20),
              // **************** sold In  *********************
              DropdownButtonFormField(
                dropdownColor: const Color.fromARGB(255, 157, 217, 244),
                icon: const Icon(Icons.arrow_drop_down_circle,
                    color: Colors.blueAccent),
                value: _selectedValue,
                items: _soldInList.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Sold In",
                  prefixIcon: Icon(Icons.person_3_rounded),
                ),
                onChanged: (val) {
                  // setState() {
                  {
                    _selectedValue = val as String;
                  }
                },
                onSaved: (value) {
                  _shopItem.soldIn = value.toString();
                  debugPrint("SoldIn value => $value");
                },
              ),
              const SizedBox(height: 20),
              //*******************  comments *********************
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "Comments",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.comment_rounded),
                ),
                onSaved: (value) {
                  _shopItem.comments = value.toString();
                  debugPrint("Comments in value => $value");
                },
              ),
              const SizedBox(height: 20),
              //*************************  barcode  ************************
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      decoration: const InputDecoration(
                        labelText: "Barcode",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.barcode_reader),
                      ),
                      obscureText: true,
                      onSaved: (value) {
                        _shopItem.barcode = value.toString();
                        debugPrint("Barcode in value => $value");
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        // String barcodeScanRes =
                        //     await FlutterBarcodeScanner.scanBarcode(
                        //        "#ff6666", "Cancel", false, ScanMode.DEFAULT);
                      },
                      highlightColor: Colors.amber,
                      icon: const Icon(Icons.barcode_reader))
                ],
              ),
              const SizedBox(height: 20),
              //********************  change to a picking box ****************
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onChanged: (_) => FocusScope.of(context).nextFocus(),
                decoration: const InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category_rounded),
                ),
                onSaved: (value) {
                  _shopItem.cat = value.toString();
                  debugPrint("Cat in value => $value");
                },
              ),
              const SizedBox(height: 20),
              // ******************* price  ****************************
              TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: const InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.price_change_rounded),
                ),
                onSaved: (value) {
                  _shopItem.price = double.tryParse(value!);
                  debugPrint("Price in value => $value");
                },
              ),
              const SizedBox(height: 20),
              // *******************  store  ********************
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: const InputDecoration(
                  labelText: "Store Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.store_rounded),
                ),
                onSaved: (value) {
                  _shopItem.store = value.toString();
                  debugPrint("Store in value => $value");
                },
              ),
              const SizedBox(height: 20),
              // *******************  sold location  *********************
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: const InputDecoration(
                  labelText: "Sold Location",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_pin),
                ),
                onSaved: (value) {
                  _shopItem.storeLocation = value.toString();
                  debugPrint("Sold Location in value => $value");
                },
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

/*  build 
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Item to Inventory"),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            fabPressed(context);
          },
          backgroundColor: Colors.green,
          icon: const Icon(Icons.save_alt_rounded),
          label: const Text("Add item"),
        ),
        body: addItemForm());
  }
}
