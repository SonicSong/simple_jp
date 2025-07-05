import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database.dart';

class Settings extends StatelessWidget {

  bool darkMode = false;

  Future<void> saveDataOptions() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        // child: Switch(value: darkMode, onChanged: (bool value) (darkMode = )),
      ),
    );
  }
}