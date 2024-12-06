import 'package:firebase_core/firebase_core.dart';
import '../pages/add_shopping_item/add_shopping_item.dart';
import '../pages/authenticate/sign_in.dart';
import '../pages/home/home.dart';
import '../pages/search/search_item.dart';
import '../pages/settings/settings.dart';
import '../pages/test.dart';
//import 'package:firebase_shopping_list/pages/test.dart';
import 'package:flutter/material.dart';
import 'services/firebase/firebase_options.dart';
import 'constants.dart' as constants;

Future<void> main() async {
  // needed so no errors calling firebase methods
  WidgetsFlutterBinding.ensureInitialized();
  // init firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: constants.appName,
      theme: ThemeData(
        useMaterial3: true,
        // primarySwatch: Colors.blue,
      ),
      initialRoute: '/signIn',
      // navigation page names
      routes: {
        '/home': (context) => const MyHomePage(title: constants.appName),
        '/signIn': (context) => const SignIn(),
        '/addItem': (context) => const AddShoppingItem(),
        '/searchItem': (context) => const SearchItem(),
        '/settings': (context) => const SettingsPage(),
        '/test': (context) => const TestUi(), // used for testing ui
      },
    );
  }
}
