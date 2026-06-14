import 'package:sqflite/sqflite.dart';

/// BEGIN ADDUSERNAME
Future performAddUsername(
  Database database, {
  String? username,
}) {
  final query = '''
INSERT INTO Usernames (username) VALUES ('${username}');
''';
  return database.rawQuery(query);
}

/// END ADDUSERNAME

/// BEGIN ADDPASSWORD
Future performAddPassword(
  Database database, {
  String? password,
}) {
  final query = '''
INSERT INTO UserPasswords (password) VALUES ('${password}');
''';
  return database.rawQuery(query);
}

/// END ADDPASSWORD

/// BEGIN ADDBUDGETLIST
Future performAddBudgetList(
  Database database, {
  String? title,
  String? description,
  double? amount,
  String? categories,
}) {
  final query = '''
INSERT INTO BudgetList (title, description, amount, categories) VALUES ('${title}', '${description}', ${amount}, '${categories}');
''';
  return database.rawQuery(query);
}

/// END ADDBUDGETLIST
