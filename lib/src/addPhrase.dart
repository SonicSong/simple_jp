import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../main.dart';

class addPhrase extends StatelessWidget {
  Future<void> addNewPhrase(String category, String plText, String jpText, String romaji, String note) async {

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Podaj kategorię',
            ),
          )
        )
      ],
    );
  }
}

class dropDownMenu extends StatefulWidget {
  const dropDownMenu({super.key});

  @override
  State<dropDownMenu> createState() => _dropDownMenuCategory();
}

class _dropDownMenuCategory extends State<dropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list_EN.first,
      onSelected: (String? value) {

      },
      dropdownMenuEntries: [],
    );
  }
}