import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'folder_create_widget.dart' show FolderCreateWidget;
import 'package:flutter/material.dart';

class FolderCreateModel extends FlutterFlowModel<FolderCreateWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for folderNameWIDGET widget.
  FocusNode? folderNameWIDGETFocusNode;
  TextEditingController? folderNameWIDGETTextController;
  String? Function(BuildContext, String?)?
      folderNameWIDGETTextControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<FolderCreateCollectionRecord>? existingFolder;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FolderCreateCollectionRecord? folderCreateRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    folderNameWIDGETFocusNode?.dispose();
    folderNameWIDGETTextController?.dispose();
  }
}
