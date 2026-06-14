import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'nav_folder_widget.dart' show NavFolderWidget;
import 'package:flutter/material.dart';

class NavFolderModel extends FlutterFlowModel<NavFolderWidget> {
  ///  Local state fields for this page.

  int? sameFolders = 0;

  bool activeSearch = false;

  bool activeVisible = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter text';
    }

    if (val.length < 2) {
      return '2 characters or more ';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in IconButton widget.
  bool? formValidation;
  List<FolderCreateCollectionRecord> simpleSearchResults = [];
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<BudgetListCollectionRecord>? deleteSameFolder;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<BudgetListCollectionRecord>? sameFoldersCount;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<BudgetListCollectionRecord>? deleteSameFolderSearch;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<BudgetListCollectionRecord>? sameFoldersCountSearch;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
