import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Phrase {
  final int id;
  final int category;
  final String plText;
  final String jpText;
  final String romaji;
  final String notes;

  Phrase({
    required this.id,
    required this.category,
    required this.plText,
    required this.jpText,
    required this.romaji,
    required this.notes,
  });

  factory Phrase.fromMap(Map<String, dynamic> m) => Phrase(
    id: m['id'],
    category: m['category'],
    plText: m['pl_text'],
    jpText: m['jp_text'],
    romaji: m['romaji'],
    notes: m['notes'] ?? '',
  );
}

class SqlDbCreate {
  Future<List<Map<String, dynamic>>> getQuestions() async {
    final database = await initializeDatabase();
    return await database.query('phrases');
  }

  Future<Database> initializeDatabase() async {
    final docDir = await getApplicationDocumentsDirectory();
    final dbPath = join(docDir.path, 'QuestionsDB.db');

    if (!await databaseExists(dbPath)) {
      await Directory(dirname(dbPath)).create(recursive: true);
      final data = await rootBundle.load('assets/QuestionsDB.db');
      final bytes = data.buffer.asUint8List();
      await File(dbPath).writeAsBytes(bytes, flush: true);
    }
    
    return await openDatabase(dbPath);
  }

  Future<List<Map<String, Object?>>> getQuestionsByCategory(String category) async {
    final database = await initializeDatabase();
    return await database.rawQuery('SELECT * FROM phrases WHERE category = ?', [category]);
  }

  Future<List<Map<String, Object?>>> addQuestion(String category, String plText, String jpText, String romaji, String note) async {
    final database = await initializeDatabase();
    return await database.rawQuery('INSERT INTO phrases(category, pl_text, jp_text, romaji, notes) VALUES (SELECT id FROM categories WHERE category = ?), ?, ?, ?, ?)', [category, plText, jpText, romaji, note]);
  }
}

//For making requests to the database make use of category to not pull too much data at once. For example use 'Directions' to get all questions related to directions and not all questions.

//Example of question
// {
// "category": "Directions",
// "pl_text": "Gdzie jest sklep?",
// "jp_text": "コンビニはどこにありますか？",
// "romaji": "Konbini wa doko ni arimasu ka?"
// "notes": "Use this phrase when asking for the location of a convenience store."
// },