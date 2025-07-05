import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database.dart';
import '../main.dart';

class Settings extends StatelessWidget {
  Future<void> saveDataOptions() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwitchDarkMode(),
            ExportDataFromDB(),
          ],
        ),
      ),
    );
  }
}

class SwitchDarkMode extends StatefulWidget {
  const SwitchDarkMode({super.key});

  @override
  State<SwitchDarkMode> createState() => _SwitchDarkMode();
}

class _SwitchDarkMode extends State<SwitchDarkMode> {
  bool darkMode = false;
  ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Text('Ciemny motyw'),
        Spacer(),
        Switch(
          value: darkMode,
          activeColor: Colors.white,
          onChanged: (bool value) {
            setState(() {
              darkMode = value;
              themeMode = ThemeMode.dark;
            });
          },
        ),
        Spacer(),
      ],
    );
  }
}


class ExportDataFromDB extends StatefulWidget {
  const ExportDataFromDB({super.key});

  @override
  State<ExportDataFromDB> createState() => _ExportDataFromDB();
}

class _ExportDataFromDB extends State<ExportDataFromDB> {
  @override
  Widget build(BuildContext context) {
    return Text('Not workign yet anything in settings.');
  }
}

//Legacy option to set dark mode
//Export data (Custom phrases) → simple DB request and JSON wrap to export it to file
//Japanese text size variable.