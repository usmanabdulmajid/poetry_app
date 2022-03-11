import 'package:path/path.dart';
import 'package:poetry_app/cache/cache_contract.dart';
import 'package:poetry_app/model/poem.dart';
import 'package:sqflite/sqflite.dart';

class SqlCache implements CacheContract {
  Future<Database> _initializeDb() async {
    String path = join(await getDatabasesPath(), 'poems_db');
    Database poemDb =
        await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('CREATE TABLE poets(name TEXT)');
      db.execute(
          'CREATE TABLE poems(id INTEGER PRIMARY KEY, title TEXT, author TEXT, lines TEXT, linecount TEXT)');
    });
    return poemDb;
  }

  late final database = _initializeDb();

  @override
  Future<void> cacheNames(List<String> poets) async {
    final db = await database;
    for (var poet in poets) {
      await db.insert('poets', {'name': poet});
    }
  }

  @override
  Future<void> cachePoetry(List<Poem> poems) async {
    final db = await database;
    for (var poem in poems) {
      await db.insert('poems', poem.toMap());
    }
  }

  @override
  Future<List<Poem>> poems(String poet) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db
        .rawQuery('SELECT * FROM poems  WHERE author LIKE ?', ['%$poet%']);

    List<Poem> poems = result.map((e) => Poem.fromMap(e)).toList();
    return poems;
  }

  @override
  Future<List<String>> poets() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query('poets');
    List<String> poets = [];
    for (var i = 0; i < result.length; i++) {
      poets.add(result[i]['name']);
    }
    return poets;
  }
}
