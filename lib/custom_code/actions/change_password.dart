// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;

Future<bool> changePassword(
  String currentPassword,
  String newPassword,
  String email,
) async {
  try {
    final auth.User? user = auth.FirebaseAuth.instance.currentUser;
    if (user == null) return false;

    final auth.AuthCredential credential = auth.EmailAuthProvider.credential(
      email: email,
      password: currentPassword,
    );

    await user.reauthenticateWithCredential(credential);
    await user.updatePassword(newPassword);

    return true;
  } catch (e) {
    return false;
  }
}
