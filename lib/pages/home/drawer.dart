import 'package:flutter/material.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../constants.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.greenAccent,
          ),
          child: Center(
              child: Text(
            appName,
            style:
                TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
            textScaleFactor: 2,
          )),
        ),
        ListTile(
          leading: const Icon(Icons.search_rounded),
          title: const Text('Find Product'),
          onTap: () {
            Navigator.pushNamed(context, '/searchItem');
            debugPrint('find product button pressed');
          },
        ),
        ListTile(
          leading: const Icon(Icons.sync_alt_rounded),
          title: const Text('Resync List'),
          onTap: () {
            // Navigator.pushNamed(context, '/settings');
            debugPrint('resync list button pressed');
          },
        ),
        ListTile(
          leading: const Icon(Icons.barcode_reader),
          title: const Text('Scan barcode'),
          onTap: () async {
            // TODO Scanner Test
            //    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            //      "#ff6666", "Cancel", false, ScanMode.DEFAULT);
            //   debugPrint('scan barcode button pressed scanned $barcodeScanRes');
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings_suggest_rounded),
          title: const Text('Change Settings'),
          onTap: () {
            Navigator.pushNamed(context, '/settings');
            debugPrint('change settings button pressed');
          },
        ),
      ],
    ),
  );
}
