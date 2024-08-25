import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_profile_auth21_widget.dart' show CreateProfileAuth21Widget;
import 'package:flutter/material.dart';

class CreateProfileAuth21Model
    extends FlutterFlowModel<CreateProfileAuth21Widget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for petName widget.
  FocusNode? petNameFocusNode;
  TextEditingController? petNameTextController;
  String? Function(BuildContext, String?)? petNameTextControllerValidator;
  // State field(s) for petSex widget.
  FormFieldController<List<String>>? petSexValueController;
  String? get petSexValue => petSexValueController?.value?.firstOrNull;
  set petSexValue(String? val) =>
      petSexValueController?.value = val != null ? [val] : [];
  // State field(s) for petBreed widget.
  FocusNode? petBreedFocusNode;
  TextEditingController? petBreedTextController;
  String? Function(BuildContext, String?)? petBreedTextControllerValidator;
  // State field(s) for petAge widget.
  FocusNode? petAgeFocusNode;
  TextEditingController? petAgeTextController;
  String? Function(BuildContext, String?)? petAgeTextControllerValidator;
  // State field(s) for petInsta widget.
  FocusNode? petInstaFocusNode;
  TextEditingController? petInstaTextController;
  String? Function(BuildContext, String?)? petInstaTextControllerValidator;
  // State field(s) for petWeight widget.
  FormFieldController<List<String>>? petWeightValueController;
  String? get petWeightValue => petWeightValueController?.value?.firstOrNull;
  set petWeightValue(String? val) =>
      petWeightValueController?.value = val != null ? [val] : [];
  // State field(s) for petBehavior widget.
  FocusNode? petBehaviorFocusNode;
  TextEditingController? petBehaviorTextController;
  String? Function(BuildContext, String?)? petBehaviorTextControllerValidator;
  // State field(s) for peopleBehavior widget.
  FocusNode? peopleBehaviorFocusNode;
  TextEditingController? peopleBehaviorTextController;
  String? Function(BuildContext, String?)?
      peopleBehaviorTextControllerValidator;
  // State field(s) for neutered widget.
  FormFieldController<List<String>>? neuteredValueController;
  String? get neuteredValue => neuteredValueController?.value?.firstOrNull;
  set neuteredValue(String? val) =>
      neuteredValueController?.value = val != null ? [val] : [];
  // State field(s) for Rabies widget.
  FormFieldController<List<String>>? rabiesValueController;
  String? get rabiesValue => rabiesValueController?.value?.firstOrNull;
  set rabiesValue(String? val) =>
      rabiesValueController?.value = val != null ? [val] : [];
  // State field(s) for DHLPP widget.
  FormFieldController<List<String>>? dhlppValueController;
  String? get dhlppValue => dhlppValueController?.value?.firstOrNull;
  set dhlppValue(String? val) =>
      dhlppValueController?.value = val != null ? [val] : [];
  // State field(s) for feedingSchedule widget.
  FocusNode? feedingScheduleFocusNode;
  TextEditingController? feedingScheduleTextController;
  String? Function(BuildContext, String?)?
      feedingScheduleTextControllerValidator;
  // State field(s) for medication widget.
  FocusNode? medicationFocusNode;
  TextEditingController? medicationTextController;
  String? Function(BuildContext, String?)? medicationTextControllerValidator;
  // State field(s) for aboutPet widget.
  FocusNode? aboutPetFocusNode;
  TextEditingController? aboutPetTextController;
  String? Function(BuildContext, String?)? aboutPetTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    petNameFocusNode?.dispose();
    petNameTextController?.dispose();

    petBreedFocusNode?.dispose();
    petBreedTextController?.dispose();

    petAgeFocusNode?.dispose();
    petAgeTextController?.dispose();

    petInstaFocusNode?.dispose();
    petInstaTextController?.dispose();

    petBehaviorFocusNode?.dispose();
    petBehaviorTextController?.dispose();

    peopleBehaviorFocusNode?.dispose();
    peopleBehaviorTextController?.dispose();

    feedingScheduleFocusNode?.dispose();
    feedingScheduleTextController?.dispose();

    medicationFocusNode?.dispose();
    medicationTextController?.dispose();

    aboutPetFocusNode?.dispose();
    aboutPetTextController?.dispose();
  }
}
