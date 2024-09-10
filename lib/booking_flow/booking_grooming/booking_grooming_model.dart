import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'booking_grooming_widget.dart' show BookingGroomingWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingGroomingModel extends FlutterFlowModel<BookingGroomingWidget> {
  ///  Local state fields for this page.

  DocumentReference? selectedProgramIndex;

  PaymentsRecord? selectedPayment;

  double? totalPrice = 0.0;

  double? cardCharges = 0.0;

  double? tax = 0.0;

  ProgramRecord? program;

  DateTime? time1;

  DateTime? time2;

  ///  State fields for stateful widgets in this page.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for ProgramRadioButton widget.
  FormFieldController<String>? programRadioButtonValueController;
  DateTime? datePicked;
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
  String? get radioButtonValue => radioButtonValueController?.value;
  String? get programRadioButtonValue =>
      programRadioButtonValueController?.value;
}
