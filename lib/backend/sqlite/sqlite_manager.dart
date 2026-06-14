import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'farm_app',
      'farmapp.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<GetBudgetListRow>> getBudgetList() => performGetBudgetList(
        _database,
      );

  Future<List<GetUsernamesRow>> getUsernames() => performGetUsernames(
        _database,
      );

  Future<List<GetPasswordsRow>> getPasswords() => performGetPasswords(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future addUsername({
    String? username,
  }) =>
      performAddUsername(
        _database,
        username: username,
      );

  Future addPassword({
    String? password,
  }) =>
      performAddPassword(
        _database,
        password: password,
      );

  Future addBudgetList({
    String? title,
    String? description,
    double? amount,
    String? categories,
  }) =>
      performAddBudgetList(
        _database,
        title: title,
        description: description,
        amount: amount,
        categories: categories,
      );

  /// END UPDATE QUERY CALLS
}
