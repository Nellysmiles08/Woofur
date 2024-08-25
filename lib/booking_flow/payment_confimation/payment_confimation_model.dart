import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_confimation_widget.dart' show PaymentConfimationWidget;
import 'package:flutter/material.dart';

class PaymentConfimationModel
    extends FlutterFlowModel<PaymentConfimationWidget> {
  ///  Local state fields for this page.

  String? cardNumber;

  bool? paySucceed;

  String? cardBrand;

  PaymentsRecord? paymentDocu;

  DaycareRecord? daycare1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
