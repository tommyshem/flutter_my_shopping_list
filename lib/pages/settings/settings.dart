import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override

  /// Builds the settings page.
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: const SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Form(
                    // key: _formKey,
                    child: Column(children: [])))));
  }
}
