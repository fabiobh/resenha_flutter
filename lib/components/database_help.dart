import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _iniciarBancoDeDados();
    return _database;
  }
  
  _iniciarBancoDeDados() async {
    Database db = await openDatabase(_databaseName);
    return db;
    /*
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion);
    */
  }

  
}