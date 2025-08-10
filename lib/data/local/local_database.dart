import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static Future<Database> getDatabase() async {
    return openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'friends_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE post(id TEXT PRIMARY KEY, userphoto TEXT, name TEXT, username TEXT, content TEXT, contentImages TEXT, createdAt TEXT, comments TEXT, reactions TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }
}
