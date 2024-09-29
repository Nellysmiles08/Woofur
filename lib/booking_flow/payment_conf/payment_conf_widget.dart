import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/daycare_container_widget.dart';
import '/components/grooming_container_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'payment_conf_model.dart';
export 'payment_conf_model.dart';

class PaymentConfWidget extends StatefulWidget {
  const PaymentConfWidget({
    super.key,
    this.payment,
    required this.amount,
    required this.paymentIntent,
    required this.reservation,
    required this.connectedAccount,
  });

  final DocumentReference? payment;
  final double? amount;
  final String? paymentIntent;
  final DocumentReference? reservation;
  final String? connectedAccount;

  @override
  State<PaymentConfWidget> createState() => _PaymentConfWidgetState();
}

class _PaymentConfWidgetState extends State<PaymentConfWidget> {
  late PaymentConfModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentConfModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.payment?.id != null && widget.payment?.id != '') {
        _model.paymentDoc = await PaymentsRecord.getDocumentOnce(
            functions.paymentRefWithUsers(
                widget.payment!.id, currentUserReference!.id));
        _model.paymentDocu = _model.paymentDoc;
      }
      _model.reservatn = await ReservationsRecord.getDocumentOnce(
          functions.reservationRefWithUser(
              widget.reservation!.id, currentUserReference!.id));
      if (_model.reservatn?.daycareRef != null) {
        _model.daycare =
            await DaycareRecord.getDocumentOnce(_model.reservatn!.daycareRef!);
        _model.daycare1 = _model.daycare;
      } else {
        _model.grooming1 = await GroomingRecord.getDocumentOnce(
            _model.reservatn!.groomingRef!);
        _model.grooming = _model.grooming1;
      }

      if (_model.reservatn?.status == 'completed') {
        if (_model.paymentDocu != null) {
          _model.paySucceed = true;
          _model.isLoading = false;
          safeSetState(() {});
        } else {
          _model.paySucceed = true;
          _model.isLoading = false;
          safeSetState(() {});
        }
      } else {
        _model.checkPayment = await StripeApiGroup.checkPaymentCall.call(
          paymentID: widget.paymentIntent,
        );

        if (StripeApiGroup.checkPaymentCall.status(
              (_model.checkPayment?.jsonBody ?? ''),
            ) ==
            'succeeded') {
          await currentUserReference!.update({
            ...mapToFirestore(
              {
                'balance':
                    FieldValue.increment(-(_model.reservatn!.balanceAmount)),
              },
            ),
          });

          await functions
              .reservationRefWithUser(
                  widget.reservation!.id, currentUserReference!.id)
              .update(createReservationsRecordData(
                status: 'completed',
              ));
          if (_model.paymentDocu != null) {
            _model.paySucceed = true;
            _model.isLoading = false;
            safeSetState(() {});
          } else {
            _model.paySucceed = true;
            _model.isLoading = false;
            safeSetState(() {});
          }
        } else {
          await functions
              .reservationRefWithUser(
                  widget.reservation!.id, currentUserReference!.id)
              .update(createReservationsRecordData(
                status: 'canceled',
              ));
          if (_model.paymentDocu != null) {
            _model.paySucceed = false;
            _model.isLoading = false;
            safeSetState(() {});
          } else {
            _model.paySucceed = false;
            _model.isLoading = false;
            safeSetState(() {});
          }
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Builder(
          builder: (context) {
            if (!_model.isLoading) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (context) {
                        if (_model.daycare1 != null) {
                          return wrapWithModel(
                            model: _model.daycareContainerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: DaycareContainerWidget(
                              daycare: _model.daycare1!,
                            ),
                          );
                        } else if (_model.grooming != null) {
                          return wrapWithModel(
                            model: _model.groomingContainerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: GroomingContainerWidget(
                              grooming: _model.grooming!,
                            ),
                          );
                        } else {
                          return Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          );
                        }
                      },
                    ),
                    Builder(
                      builder: (context) {
                        if (_model.paySucceed ?? false) {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Payment Confirmed!',
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        width: 2.0,
                                      ),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.check_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 25.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Payment Unsuccessful',
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.cancel_outlined,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 36.0,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Text(
                        formatNumber(
                          widget.amount,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.periodDecimal,
                          currency: '\$',
                        ),
                        style:
                            FlutterFlowTheme.of(context).displayLarge.override(
                                  fontFamily: 'Outfit',
                                  color: const Color(0xFF14181B),
                                  fontSize: 57.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if (_model.paySucceed ?? false) {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 8.0, 24.0, 0.0),
                            child: Text(
                              'Your payment has been confirmed, it may take 1-2 hours in order for your payment to go through and show up in your transation list.',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF57636C),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          );
                        } else {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 8.0, 24.0, 0.0),
                                child: Text(
                                  'There is an error making payment.',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: const Color(0xFF57636C),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(32.0, 20.0, 32.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(
                          minHeight: 120.0,
                          maxHeight: 140.0,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F4F8),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: const Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (valueOrDefault<bool>(
                              _model.paymentDocu != null,
                              false,
                            ))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Image.asset(
                                        'assets/images/masterCard@2x.png',
                                        width: 40.0,
                                        height: 40.0,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 4.0),
                                            child: Text(
                                              '${_model.paymentDocu?.brand} card  ending in ${_model.paymentDocu?.cardNumber}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            const Color(0xFF14181B),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 4.0),
                                            child: Text(
                                              formatNumber(
                                                functions.difference(
                                                    _model.reservatn!
                                                        .reservationPrice,
                                                    _model.reservatn!
                                                        .balanceAmount),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                                currency: '\$',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            const Color(0xFF57636C),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/WhatsApp_Image_2024-04-18_at_13.57.08_8a40ef6e.jpg',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Text(
                                            'Payment from Account',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: const Color(0xFF14181B),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Text(
                                            formatNumber(
                                              _model.reservatn!.balanceAmount,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.periodDecimal,
                                              currency: '\$',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: const Color(0xFF57636C),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.goNamed('homepage');
                        },
                        text: 'Go Home',
                        options: FFButtonOptions(
                          width: 230.0,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF14181B),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: custom_widgets.LoadingWidget(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  strokeColor: FlutterFlowTheme.of(context).primary,
                  strokeWidth: 8.0,
                  radius: 200.0,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
