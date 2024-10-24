import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// Class providing an instance of an SQLite database.
class SQLite {
  /// Private constructor for the SQLite class, used to receive the already opened database.
  ///
  /// This constructor should not be used directly. Instead, use the static [instance] method.
  const SQLite._(this._dataBase);

  /// Instance of the opened SQLite database.
  final Database _dataBase;

  /// Static method to get the instance of [SQLite].
  ///
  /// This method creates or opens the SQLite database.
  /// If the database does not exist, the [_onCreate] function is called to create the necessary tables.
  ///
  /// Returns an instance of the [SQLite] class containing the opened database.
  static Future<SQLite> get instance async {
    final String path = join(await getDatabasesPath(), 'tenis_court.db');
    final Database database = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
    );
    return SQLite._(database);
  }

  /// Private method to handle database creation.
  ///
  /// This method is called when the database is created for the first time.
  /// It executes the necessary SQL commands to create the initial database schema.
  ///
  /// [db] is the database being created, and [version] is the version of the database
  static Future<void> _onCreate(Database db, int version) async {
    final Batch batch = db.batch();
    batch.execute(_createSQLV1);
    await batch.commit();
  }

  /// Getter to access the underlying SQLite database.
  ///
  /// Returns the [Database] instance associated with this [SQLite] object.
  Database get db => _dataBase;

  /// Close the current database connection.
  Future<void> close() => _dataBase.close();
}

/// SQL to create tables.
const String _createSQLV1 = '''
CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  names TEXT NOT NULL,
  phone VARCHAR(25),
  password VARCHAR(128) NOT NULL,
  account_non_locked BOOLEAN NOT NULL,
  account_non_expired BOOLEAN NOT NULL,
  credentials_non_expired BOOLEAN NOT NULL,
  enabled BOOLEAN NOT NULL,
  creation_date DATETIME NOT NULL,
  update_date DATETIME NOT NULL
)
''';
