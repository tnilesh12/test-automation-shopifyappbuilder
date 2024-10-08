import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/language/language_manager.dart';

class Test2 extends StatelessWidget {
//  AppLocalizations al;
  Test2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
      
        children: [
          Text(LanguageManager.translations()['title']!),
          Text(LanguageManager.translations()['language']!),
                SwitchListTile(
                  value: false,
                  onChanged: (value) {
                  },
                  title: Text("Test Mode"),
                ),
                Divider(
                  height: 1,
                ),
        ],
      ),
    );
  }
}