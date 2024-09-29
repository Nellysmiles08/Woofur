import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'booking_widget.dart' show BookingWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingModel extends FlutterFlowModel<BookingWidget> {
  ///  Local state fields for this page.

  DocumentReference? selectedProgramIndex;

  PaymentsRecord? selectedPayment;

  ///  State fields for stateful widgets in this page.

  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReservationsRecord? reservationb;
  // Stores action output result for [Backend Call - API (make payment)] action in Button widget.
  ApiCallResponse? payb;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReservationsRecord? reservation1b;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReservationsRecord? reservatin1b;
  // Stores action output result for [Backend Call - API (confirm payment)] action in Button widget.
  ApiCallResponse? confirmPaymentb;
  // Stores action output result for [Backend Call - API (make payment)] action in Button widget.
  ApiCallResponse? pay;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReservationsRecord? reservation1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReservationsRecord? reservatin1;
  // Stores action output result for [Backend Call - API (confirm payment)] action in Button widget.
  ApiCallResponse? confirmPayment;
  // Stores action output result for [Backend Call - API (add payment method to customer)] action in Button widget.
  ApiCallResponse? addPaymentMethodToCustomer1;
  // Stores action output result for [Backend Call - API (set payment method default)] action in Button widget.
  ApiCallResponse? pmAsDefault;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PaymentsRecord? card;
  // Stores action output result for [Backend Call - API (create customer)] action in Button widget.
  ApiCallResponse? createCustomer;
  // Stores action output result for [Backend Call - API (add payment method to customer)] action in Button widget.
  ApiCallResponse? addPaymentMethodToCustomer2;
  // Stores action output result for [Backend Call - API (set payment method default)] action in Button widget.
  ApiCallResponse? setPaymentMethodDefault12;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PaymentsRecord? card1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
}
