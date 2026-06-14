import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'folder_edit_widget.dart' show FolderEditWidget;
import 'package:flutter/material.dart';

class FolderEditModel extends FlutterFlowModel<FolderEditWidget> {
  ///  Local state fields for this component.

  int? samefolders = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Folder_Edit widget.
  FolderCreateCollectionRecord? getFolderName;
  // State field(s) for editFolderNameWIDGET widget.
  FocusNode? editFolderNameWIDGETFocusNode;
  TextEditingController? editFolderNameWIDGETTextController;
  String? Function(BuildContext, String?)?
      editFolderNameWIDGETTextControllerValidator;
  // State field(s) for dateTextField widget.
  FocusNode? dateTextFieldFocusNode;
  TextEditingController? dateTextFieldTextController;
  String? Function(BuildContext, String?)? dateTextFieldTextControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<FolderCreateCollectionRecord>? existingFolder;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<BudgetListCollectionRecord>? updateSameFolder;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<BudgetListCollectionRecord>? sameFolderCount;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    editFolderNameWIDGETFocusNode?.dispose();
    editFolderNameWIDGETTextController?.dispose();

    dateTextFieldFocusNode?.dispose();
    dateTextFieldTextController?.dispose();
  }
}
