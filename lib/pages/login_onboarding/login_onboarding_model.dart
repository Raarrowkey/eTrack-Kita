import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_onboarding_widget.dart' show LoginOnboardingWidget;
import 'package:flutter/material.dart';

class LoginOnboardingModel extends FlutterFlowModel<LoginOnboardingWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_profileFirestoreOn = false;
  FFUploadedFile uploadedLocalFile_profileFirestoreOn =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_profileFirestoreOn = '';

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
