import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//TODO: Implement database integration to store, write and read mood "diary"

class addPhrase extends StatelessWidget {
  Future<void> addNewPhrase(String category, String plText, String jpText, String romaji, String note) async {

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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