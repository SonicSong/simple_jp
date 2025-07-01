import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDbCreate {
  Future<List<Map<String, Object?>>> getQuestions() async {
    final database = await initializeDatabase();
    return await database.rawQuery('');
  }

  Future<Database> initializeDatabase() async {
    String path = await getDatabasesPath();

    return await openDatabase(
        join(path, 'QuestionsDB.db'),
        onCreate: (database, version) async {
          await database.execute('');
    });
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