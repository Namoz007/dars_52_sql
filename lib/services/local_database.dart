import 'package:sqflite/sqflite.dart';

class LocalDatabase{
  LocalDatabase._singleton();

  static final LocalDatabase _localDatabase = LocalDatabase._singleton();

  factory LocalDatabase() {
    return _localDatabase;
  }



  Database? _database;
  Future<Database> get database async{
    if(_database != null){
      return _database!;
    }

    _database = await _initDatabse();
    return _database!;
  }



  Future<Database> _initDatabse() async{
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/notes.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }



  Future<void> _createDatabase(Database db, int version) async{
    return await db.execute('''
    CREATE TABLE notes(id int primary key autoincrement,title text not null, content text not null,created_time int not null)
    ''');

  }



  Future<void> addNote(String title) async{
    await _database!.insert('notes', {
      'title': title,
      'content':'Occaecat fugiat nisi labore magna magna nostrud ',
      'created_thime': 100,
    });
  }

}
