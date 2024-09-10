import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card_widget.dart' show CardWidget;
import 'package:flutter/material.dart';

class CardModel extends FlutterFlowModel<CardWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (create customer)] action in FloatingActionButton widget.
  ApiCallResponse? createCustomer;
  // Stores action output result for [Backend Call - API (add payment method to customer)] action in FloatingActionButton widget.
  ApiCallResponse? addPaymentMethodToCustomerCard;
  // Stores action output result for [Backend Call - API (set payment method default)] action in FloatingActionButton widget.
  ApiCallResponse? pmAsDefaultCard;
  // Stores action output result for [Backend Call - Create Document] action in FloatingActionButton widget.
  PaymentsRecord? card;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
