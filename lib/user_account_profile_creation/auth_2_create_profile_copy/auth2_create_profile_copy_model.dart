import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'auth2_create_profile_copy_widget.dart'
    show Auth2CreateProfileCopyWidget;
import 'package:flutter/material.dart';

class Auth2CreateProfileCopyModel
    extends FlutterFlowModel<Auth2CreateProfileCopyWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for yourInsta widget.
  FocusNode? yourInstaFocusNode;
  TextEditingController? yourInstaTextController;
  String? Function(BuildContext, String?)? yourInstaTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button-Login widget.
  DaycareRecord? daycareDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    yourInstaFocusNode?.dispose();
    yourInstaTextController?.dispose();
  }
}
