import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GETBUDGETLIST
Future<List<GetBudgetListRow>> performGetBudgetList(
  Database database,
) {
  final query = '''
SELECT * FROM BudgetList;
''';
  return _readQuery(database, query, (d) => GetBudgetListRow(d));
}

class GetBudgetListRow extends SqliteRow {
  GetBudgetListRow(Map<String, dynamic> data) : super(data);

  int get budgetId => data['budget_id'] as int;
  DateTime get createdAt => data['created_at'] as DateTime;
  String? get title => data['title'] as String?;
  String? get description => data['description'] as String?;
  double? get amount => data['amount'] as double?;
  String? get categories => data['categories'] as String?;
  int get userId => data['user_id'] as int;
}

/// END GETBUDGETLIST

/// BEGIN GETUSERNAMES
Future<List<GetUsernamesRow>> performGetUsernames(
  Database database,
) {
  final query = '''
SELECT * FROM Usernames;
''';
  return _readQuery(database, query, (d) => GetUsernamesRow(d));
}

class GetUsernamesRow extends SqliteRow {
  GetUsernamesRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String? get username => data['username'] as String?;
  String? get firstname => data['firstname'] as String?;
  String? get lastname => data['lastname'] as String?;
}

/// END GETUSERNAMES

/// BEGIN GETPASSWORDS
Future<List<GetPasswordsRow>> performGetPasswords(
  Database database,
) {
  final query = '''
SELECT * FROM UserPasswords;
''';
  return _readQuery(database, query, (d) => GetPasswordsRow(d));
}

class GetPasswordsRow extends SqliteRow {
  GetPasswordsRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String? get password => data['password'] as String?;
}

/// END GETPASSWORDS
