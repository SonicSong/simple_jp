import 'package:flutter/material.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:simple_jp/src/addPhrase.dart';
import 'package:simple_jp/src/settings.dart';

import 'src/database.dart';
import 'src/start.dart';
import 'src/addPhrase.dart';
import 'src/kana_convert.dart';
import 'src/translation.dart';
import 'src/settings.dart';

void main() {
  runApp(const MyApp());
}

ThemeMode themeMode = ThemeMode.system;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final ThemeMode themeMode = ThemeMode.system;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Japońskie Rozmówki',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Japońskie Rozmówki'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _CreateDatabase() async {
    try {
      await SqlDbCreate().initializeDatabase();
      print ('Database created successfully');
    } catch (e) {
      print('Error creating database: $e');
    }
  }
  bool? _isFirstRun;
  void _checkFirstRun() async {
    bool ifr = await IsFirstRun.isFirstRun();
    setState(() {
      _isFirstRun = ifr;
    });
    if (_isFirstRun == true) {
      // _CreateDatabase();
      // await _CreateDB();
    }
  }

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    // Add your widgets here
    Start(),
    addPhrase(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _checkFirstRun();
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Strona Główna',
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Dodawanie Fraz',
            backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ustawienia',
            backgroundColor: Colors.grey
          ),
        ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
      ),
    );
  }
}
