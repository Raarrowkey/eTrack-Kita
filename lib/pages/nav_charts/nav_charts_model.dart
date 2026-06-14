import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'nav_charts_widget.dart' show NavChartsWidget;
import 'package:flutter/material.dart';

class NavChartsModel extends FlutterFlowModel<NavChartsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  FolderCreateCollectionRecord? dropdownActionFolder;
  // State field(s) for DropDownYear widget.
  String? dropDownYearValue;
  FormFieldController<String>? dropDownYearValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
