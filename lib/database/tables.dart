class Tables {
  static String userTableName = "users";
  static String userTable = '''
  CREATE TABLE IF NOT EXISTS $userTableName (
  userId INTEGER PRIMARY KEY AUTOINCREMENT,
  fullname TEXT,
  email TEXT,
  username TEXT UNIQUE,
  password TEXT
  )''';

  static String noteTableName = "notes";
  static String noteTable = '''
  CREATE TABLE $noteTable (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    desc TEXT
  )''';
}
