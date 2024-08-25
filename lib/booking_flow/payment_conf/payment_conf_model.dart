import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/daycare_container_widget.dart';
import '/components/grooming_container_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_conf_widget.dart' show PaymentConfWidget;
import 'package:flutter/material.dart';

class PaymentConfModel extends FlutterFlowModel<PaymentConfWidget> {
  ///  Local state fields for this page.

  bool? paySucceed;

  PaymentsRecord? paymentDocu;

  DaycareRecord? daycare1;

  bool isLoading = true;

  GroomingRecord? grooming;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in paymentConf widget.
  PaymentsRecord? paymentDoc;
  // Stores action output result for [Backend Call - Read Document] action in paymentConf widget.
  ReservationsRecord? reservatn;
  // Stores action output result for [Backend Call - Read Document] action in paymentConf widget.
  DaycareRecord? daycare;
  // Stores action output result for [Backend Call - Read Document] action in paymentConf widget.
  GroomingRecord? grooming1;
  // Stores action output result for [Backend Call - API (check payment)] action in paymentConf widget.
  ApiCallResponse? checkPayment;
  // Model for daycareContainer component.
  late DaycareContainerModel daycareContainerModel;
  // Model for groomingContainer component.
  late GroomingContainerModel groomingContainerModel;

  @override
  void initState(BuildContext context) {
    daycareContainerModel = createModel(context, () => DaycareContainerModel());
    groomingContainerModel =
        createModel(context, () => GroomingContainerModel());
  }

  @override
  void dispose() {
    daycareContainerModel.dispose();
    groomingContainerModel.dispose();
  }
}
