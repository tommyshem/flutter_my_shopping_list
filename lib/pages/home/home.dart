import 'package:flutter/material.dart';
import '../../data_,models/current_user_model.dart';
import '../../services/firebase/firestore_db.dart ';
import 'appbar.dart';
import 'card_layout.dart';
import 'drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // init firebase database
  FireStoreDB db = FireStoreDB();

  @override

  /// Build the home page of the app.
  ///
  /// The home page displays the list of shopping items. It also provides an app
  /// bar with a search button and a floating action button to add a new item.
  ///
  /// The page also includes a drawer that allows the user to switch between
  /// accounts and to log out.
  ///
  /// The data is loaded from the Firebase Firestore database.
  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as CurrentUser;
    db.userName = user.userName;
    db.userImagePath = user.userImagePath;
    db.readAllShoppingList();
    return Scaffold(
      // Drawer
      drawer: buildDrawer(context),
      // App Bar
      appBar: buildAppBar(context, db, widget),
      // Body
      body: FutureBuilder(
          future: db.readAllShoppingList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return shoppingItemCardLayout(
                      context, snapshot, index, db, callback);
                },
              );
            } else if (snapshot.hasError) {
              debugPrint("Loading shopping list data =>${snapshot.error}");
              return (const Center(child: Text('Something Went wrong')));
            } else {
              return (const Center(child: CircularProgressIndicator()));
            }
          }),
      // Floating Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            Navigator.pushNamed(context, '/searchItem', arguments: db)
                .then((_) => setState(() {}));
          });
        },
        icon: const Icon(Icons.search_rounded),
        label: const Text("Add Item"),
      ),
    );
  }

  callback(snapshot, index) {
    setState(() {
      db.deleteShoppingItem(snapshot.data![index].id!);
    });
  }
}
