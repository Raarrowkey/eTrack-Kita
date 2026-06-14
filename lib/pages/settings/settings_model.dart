import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  Local state fields for this page.

  int? sameBudgetsCount;

  int? sameFoldersCount;

  int? sameNotifyCount;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in listContainer widget.
  ProfileCollectionRecord? deleteProfile;
  // Stores action output result for [Firestore Query - Query a collection] action in listContainer widget.
  int? deleteBudgetList;
  // Stores action output result for [Firestore Query - Query a collection] action in listContainer widget.
  BudgetListCollectionRecord? deleteBudgets;
  // Stores action output result for [Firestore Query - Query a collection] action in listContainer widget.
  int? deleteFolderList;
  // Stores action output result for [Firestore Query - Query a collection] action in listContainer widget.
  FolderCreateCollectionRecord? deleteFolders;
  // Stores action output result for [Firestore Query - Query a collection] action in listContainer widget.
  int? deleteNotifyList;
  // Stores action output result for [Firestore Query - Query a collection] action in listContainer widget.
  NotifyActionCollectionRecord? deleteNotify;
  // State field(s) for oldPassword widget.
  FocusNode? oldPasswordFocusNode;
  TextEditingController? oldPasswordTextController;
  late bool oldPasswordVisibility;
  String? Function(BuildContext, String?)? oldPasswordTextControllerValidator;
  // State field(s) for newPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  // Stores action output result for [Custom Action - changePassword] action in Button-Login widget.
  bool? changePasswordResult;

  @override
  void initState(BuildContext context) {
    oldPasswordVisibility = false;
    newPasswordVisibility = false;
    confirmPasswordVisibility = false;
  }

  @override
  void dispose() {
    oldPasswordFocusNode?.dispose();
    oldPasswordTextController?.dispose();

    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
