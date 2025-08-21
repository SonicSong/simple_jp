import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Drop_DownMenu(),
          )
      ],
    );
  }
}

class Drop_DownMenu extends StatefulWidget {
  const Drop_DownMenu({super.key});

  @override
  State<Drop_DownMenu> createState() => _DropDownMenu();
}

class _DropDownMenu extends State<Drop_DownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list_EN.first,
      onSelected: (String? value) {

      },
      dropdownMenuEntries: List.generate(
        list_EN.length,
            (index) => DropdownMenuEntry<String>(
          value: list_EN[index],
          label: list_PL[index],
        ),
      ),
    );
  }
}