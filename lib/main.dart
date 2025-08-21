import 'package:flutter/material.dart';
import 'package:is_first_run/is_first_run.dart';

import 'src/database.dart';
import 'src/start.dart';
import 'src/addPhrase.dart';
import 'src/translation.dart';
import 'src/settings.dart';

void main() {
  runApp(const MyApp());
}

ThemeMode themeMode = ThemeMode.system;

const List<String> list_EN = <String>["Directions", "Basic Questions", "Travel", "Accommodation", "Food & Ordering", "Shopping", "Numbers & Quantity",
"Health & Emergencies", "Language & Communication", "Misc / Politeness"];

const List<String> list_PL = <String>["Wskazówki", "Podstawowe pytania", "Podróż", "Zakwaterowanie", "Jedzenie i zamawianie", "Zakupy", "Liczby i ilości",
"Zdrowie i nagłe wypadki", "Język i komunikacja", "Różne / Grzeczność"];


const List<String> list_EN_cat = <String>["All" ,"Directions", "Basic Questions", "Travel", "Accommodation", "Food & Ordering", "Shopping", "Numbers & Quantity",
  "Health & Emergencies", "Language & Communication", "Misc / Politeness"];

const List<String> list_PL_cat = <String>["Wszystko", "Wskazówki", "Podstawowe pytania", "Podróż", "Zakwaterowanie", "Jedzenie i zamawianie", "Zakupy", "Liczby i ilości",
  "Zdrowie i nagłe wypadki", "Język i komunikacja", "Różne / Grzeczność"];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  bool? _isFirstRun;

  @override
  void initState() {
    super.initState();
    _checkFirstRun();
  }
  
  void _checkFirstRun() async {
    bool ifr = await IsFirstRun.isFirstRun();
    setState(() {
      _isFirstRun = ifr;
    });
    if (ifr) {
      await SqlDbCreate().initializeDatabase();
      await TranslationClass().ensureModelDownloaded();
      print("DB loaded.");
    }
  }

  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
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
    return Scaffold(
      appBar: AppBar(title: Text("Japońskie rozmówki")),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
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