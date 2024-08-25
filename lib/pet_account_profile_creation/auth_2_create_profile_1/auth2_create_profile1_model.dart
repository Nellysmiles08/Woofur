import '/flutter_flow/flutter_flow_util.dart';
import '/pet_account_profile_creation/create_profile_auth_2_1/create_profile_auth21_widget.dart';
import 'auth2_create_profile1_widget.dart' show Auth2CreateProfile1Widget;
import 'package:flutter/material.dart';

class Auth2CreateProfile1Model
    extends FlutterFlowModel<Auth2CreateProfile1Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for createProfile_auth_2_1 component.
  late CreateProfileAuth21Model createProfileAuth21Model;

  @override
  void initState(BuildContext context) {
    createProfileAuth21Model =
        createModel(context, () => CreateProfileAuth21Model());
  }

  @override
  void dispose() {
    createProfileAuth21Model.dispose();
  }
}
