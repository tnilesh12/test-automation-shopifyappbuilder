import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseService {
  static Future<Database> CreateDatabase() async {
    return await openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'sp_store_database.db'),
      onCreate: (db, version) async {
        // Run the CREATE TABLE statement on the database.
        //  return
        //  {

        await db.execute(
            '''CREATE TABLE favorites(id INTEGER PRIMARY KEY AUTOINCREMENT, product_id TEXT)''');
        await db.execute(
            '''CREATE TABLE cart(id INTEGER PRIMARY KEY, title TEXT,quantity INTEGER,variantId TEXT,variant TEXT)''');
        await db.execute(
            '''CREATE TABLE search_history(id INTEGER PRIMARY KEY AUTOINCREMENT, search_text TEXT)''');
        await db.execute(
            '''CREATE TABLE recent_product(id TEXT,title TEXT,price TEXT,image TEXT,date TEXT)''');
        // };
        //  return await db.execute(
        //   'CREATE TABLE favorites(id INTEGER PRIMARY KEY, product_id TEXT)',
        // );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }
  // static
}
