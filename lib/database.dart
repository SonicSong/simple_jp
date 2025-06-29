import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDbCreate {
  Future<List<Map<String, Object?>>> getQuestions() async {
    final database = await initializeDatabase();
    return await database.rawQuery('');
  }

  Future<Database> initializeDatabase() async {
    String path = await getDatabasesPath();

    return await openDatabase(join(path, 'QuestionsDB.db'),
    onCreate: (database, version) async {
      await database.execute('');
    });
  }
}