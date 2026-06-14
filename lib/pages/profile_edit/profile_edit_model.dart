import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_edit_widget.dart' show ProfileEditWidget;
import 'package:flutter/material.dart';

class ProfileEditModel extends FlutterFlowModel<ProfileEditWidget> {
  ///  Local state fields for this component.

  String? profileURLSTATE;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Profile_Edit widget.
  ProfileCollectionRecord? getProfile;
  bool isDataUploading_profileFirestore = false;
  FFUploadedFile uploadedLocalFile_profileFirestore =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_profileFirestore = '';

  // State field(s) for firstNameWIDGET widget.
  FocusNode? firstNameWIDGETFocusNode;
  TextEditingController? firstNameWIDGETTextController;
  String? Function(BuildContext, String?)?
      firstNameWIDGETTextControllerValidator;
  // State field(s) for lastNameWIDGET widget.
  FocusNode? lastNameWIDGETFocusNode;
  TextEditingController? lastNameWIDGETTextController;
  String? Function(BuildContext, String?)?
      lastNameWIDGETTextControllerValidator;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode;
  TextEditingController? myBioTextController;
  String? Function(BuildContext, String?)? myBioTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    firstNameWIDGETFocusNode?.dispose();
    firstNameWIDGETTextController?.dispose();

    lastNameWIDGETFocusNode?.dispose();
    lastNameWIDGETTextController?.dispose();

    myBioFocusNode?.dispose();
    myBioTextController?.dispose();
  }
}
