import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/stripe_form_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'booking_grooming_model.dart';
export 'booking_grooming_model.dart';

class BookingGroomingWidget extends StatefulWidget {
  const BookingGroomingWidget({
    super.key,
    required this.daycare,
  });

  final DocumentReference? daycare;

  @override
  State<BookingGroomingWidget> createState() => _BookingGroomingWidgetState();
}

class _BookingGroomingWidgetState extends State<BookingGroomingWidget> {
  late BookingGroomingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingGroomingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GroomingRecord>(
      stream: GroomingRecord.getDocument(widget.daycare!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final bookingGroomingGroomingRecord = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderRadius: 8.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.more_vert_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          bookingGroomingGroomingRecord.img,
                                          width: double.infinity,
                                          height: 280.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  bookingGroomingGroomingRecord
                                                      .name,
                                                  '-',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                bookingGroomingGroomingRecord
                                                    .rules,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  final serviceTime =
                                                      bookingGroomingGroomingRecord
                                                          .availibility
                                                          .toList();

                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: List.generate(
                                                        serviceTime.length,
                                                        (serviceTimeIndex) {
                                                      final serviceTimeItem =
                                                          serviceTime[
                                                              serviceTimeIndex];
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    3.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Text(
                                                                serviceTimeItem
                                                                    .dayofweek,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    serviceTimeItem
                                                                        .startTime,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .arrow_right_alt_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  serviceTimeItem
                                                                      .endTime,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.home_filled,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      bookingGroomingGroomingRecord
                                                          .neighborhood,
                                                      '-',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(width: 4.0)),
                                              ),
                                            ].divide(const SizedBox(height: 6.0)),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          Text(
                                            'Pets',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: StreamBuilder<
                                                        List<PetsRecord>>(
                                                      stream: queryPetsRecord(
                                                        parent:
                                                            currentUserReference,
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<PetsRecord>
                                                            columnPetsRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final columnPetsRecord =
                                                            columnPetsRecordList
                                                                    .isNotEmpty
                                                                ? columnPetsRecordList
                                                                    .first
                                                                : null;

                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Text(
                                                                columnPetsRecord!
                                                                    .petName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 4.0)),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 8.0)),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              if ((_model.totalPrice! >
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.balance,
                                                          0.0)) &&
                                                  (_model.totalPrice != 0.0)) {
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                    Text(
                                                      'Select Payment',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    FutureBuilder<
                                                        List<PaymentsRecord>>(
                                                      future:
                                                          queryPaymentsRecordOnce(
                                                        parent:
                                                            currentUserReference,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<PaymentsRecord>
                                                            containerPaymentsRecordList =
                                                            snapshot.data!;

                                                        return Container(
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child:
                                                              FlutterFlowRadioButton(
                                                            options:
                                                                containerPaymentsRecordList
                                                                    .map((e) =>
                                                                        e.cardNumber)
                                                                    .toList()
                                                                    .toList(),
                                                            onChanged:
                                                                (val) async {
                                                              safeSetState(
                                                                  () {});
                                                              _model.selectedPayment =
                                                                  containerPaymentsRecordList
                                                                      .where((e) =>
                                                                          e.cardNumber ==
                                                                          _model
                                                                              .radioButtonValue)
                                                                      .toList()
                                                                      .first;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            controller: _model
                                                                    .radioButtonValueController ??=
                                                                FormFieldController<
                                                                        String>(
                                                                    null),
                                                            optionHeight: 32.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            selectedTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            buttonPosition:
                                                                RadioButtonPosition
                                                                    .left,
                                                            direction:
                                                                Axis.vertical,
                                                            radioButtonColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            inactiveRadioButtonColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            toggleable: false,
                                                            horizontalAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                );
                                              } else {
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Credit:',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              Text(
                                                            formatNumber(
                                                              functions.toTwoDecimalPlaces(
                                                                  valueOrDefault<
                                                                      double>(
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.balance,
                                                                    0.0),
                                                                0.0,
                                                              )),
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .periodDecimal,
                                                              currency: '\$',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              }
                                            },
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          Text(
                                            'Program',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          FutureBuilder<List<ProgramRecord>>(
                                            future: queryProgramRecordOnce(
                                              parent: widget.daycare,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ProgramRecord>
                                                  containerProgramRecordList =
                                                  snapshot.data!;

                                              return Container(
                                                decoration: const BoxDecoration(),
                                                child: FlutterFlowRadioButton(
                                                  options:
                                                      containerProgramRecordList
                                                          .map((e) => e.name)
                                                          .toList()
                                                          .toList(),
                                                  onChanged: (val) async {
                                                    safeSetState(() {});
                                                    _model.selectedProgramIndex =
                                                        containerProgramRecordList
                                                            .where((e) =>
                                                                e.name ==
                                                                _model
                                                                    .programRadioButtonValue)
                                                            .toList()
                                                            .first
                                                            .reference;
                                                    _model.program =
                                                        containerProgramRecordList
                                                            .where((e) =>
                                                                e.name ==
                                                                _model
                                                                    .programRadioButtonValue)
                                                            .toList()
                                                            .first;
                                                    _model.totalPrice = functions
                                                        .toTwoDecimalPlaces(functions
                                                            .groomingPriceCalculator(
                                                                _model.program,
                                                                FFAppConstants
                                                                    .groomingTaxInPercent));
                                                    _model
                                                        .cardCharges = valueOrDefault(
                                                                currentUserDocument
                                                                    ?.balance,
                                                                0.0) >=
                                                            _model.totalPrice!
                                                        ? 0.0
                                                        : functions.toTwoDecimalPlaces(
                                                            functions.seperatePayment(
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.balance,
                                                                    0.0),
                                                                _model
                                                                    .totalPrice!));
                                                    _model.tax = functions
                                                        .toTwoDecimalPlaces(
                                                            functions.calculateTax(
                                                                _model.program
                                                                    ?.price
                                                                    .toDouble(),
                                                                FFAppConstants
                                                                    .groomingTaxInPercent));
                                                    safeSetState(() {});
                                                  },
                                                  controller: _model
                                                          .programRadioButtonValueController ??=
                                                      FormFieldController<
                                                          String>(null),
                                                  optionHeight: 32.0,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  selectedTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  buttonPosition:
                                                      RadioButtonPosition.left,
                                                  direction: Axis.vertical,
                                                  radioButtonColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  inactiveRadioButtonColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  toggleable: false,
                                                  horizontalAlignment:
                                                      WrapAlignment.start,
                                                  verticalAlignment:
                                                      WrapCrossAlignment.start,
                                                ),
                                              );
                                            },
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Text(
                                              'Request a time',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 4.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Select Date',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet<
                                                            bool>(
                                                        context: context,
                                                        builder: (context) {
                                                          final datePickedCupertinoTheme =
                                                              CupertinoTheme.of(
                                                                  context);
                                                          return ScrollConfiguration(
                                                            behavior:
                                                                const MaterialScrollBehavior()
                                                                    .copyWith(
                                                              dragDevices: {
                                                                PointerDeviceKind
                                                                    .mouse,
                                                                PointerDeviceKind
                                                                    .touch,
                                                                PointerDeviceKind
                                                                    .stylus,
                                                                PointerDeviceKind
                                                                    .unknown
                                                              },
                                                            ),
                                                            child: Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  3,
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              child:
                                                                  CupertinoTheme(
                                                                data: datePickedCupertinoTheme
                                                                    .copyWith(
                                                                  textTheme: datePickedCupertinoTheme
                                                                      .textTheme
                                                                      .copyWith(
                                                                    dateTimePickerTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                child:
                                                                    CupertinoDatePicker(
                                                                  mode:
                                                                      CupertinoDatePickerMode
                                                                          .date,
                                                                  minimumDate:
                                                                      (getCurrentTimestamp ??
                                                                          DateTime(
                                                                              1900)),
                                                                  initialDateTime:
                                                                      getCurrentTimestamp,
                                                                  maximumDate:
                                                                      DateTime(
                                                                          2050),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  use24hFormat:
                                                                      false,
                                                                  onDateTimeChanged:
                                                                      (newDateTime) =>
                                                                          safeSetState(
                                                                              () {
                                                                    _model.datePicked =
                                                                        newDateTime;
                                                                  }),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                  },
                                                  child: Container(
                                                    width: 150.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    4.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                                "yMd",
                                                                _model
                                                                    .datePicked),
                                                            'Pick date',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Check In',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height: 36.0,
                                                          child: custom_widgets
                                                              .CustomTimePicker(
                                                            width:
                                                                double.infinity,
                                                            height: 36.0,
                                                            currentTime:
                                                                getCurrentTimestamp,
                                                            time: _model.time1,
                                                            defaultText:
                                                                'Start Time',
                                                            setTime:
                                                                (newTime) async {
                                                              _model.time1 =
                                                                  newTime;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 8.0),
                                                    child: Icon(
                                                      Icons
                                                          .trending_flat_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 32.0,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Check Out',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height: 36.0,
                                                          child: custom_widgets
                                                              .CustomTimePicker(
                                                            width:
                                                                double.infinity,
                                                            height: 36.0,
                                                            currentTime:
                                                                getCurrentTimestamp,
                                                            time: _model.time2,
                                                            defaultText:
                                                                'End Time',
                                                            setTime:
                                                                (newTime) async {
                                                              _model.time2 =
                                                                  newTime;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 8.0)),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Price',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 4.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          _model.program?.price,
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .periodDecimal,
                                                          currency: '\$',
                                                        ),
                                                        '0.0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .displaySmall
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 0.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Account balance',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      formatNumber(
                                                        functions.toTwoDecimalPlaces(
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.balance,
                                                                0.0)),
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .periodDecimal,
                                                        currency: '\$',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelLarge
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Tax (${FFAppConstants.groomingTaxInPercent.toString()}%)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      _model.tax,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .periodDecimal,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Card charges',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      _model.cardCharges,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .periodDecimal,
                                                      currency: '\$',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Your Total',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 4.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        formatNumber(
                                                          _model.totalPrice,
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .periodDecimal,
                                                          currency: '\$',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 0.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 4.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ].addToEnd(const SizedBox(height: 32.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 12.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => FFButtonWidget(
                        onPressed: (((_model.selectedProgramIndex == null) &&
                                    (valueOrDefault(
                                            currentUserDocument?.balance, 0.0) <
                                        _model.totalPrice!)) ||
                                (_model.time1 == null) ||
                                (_model.time2 == null))
                            ? null
                            : () async {
                                if (valueOrDefault(
                                            currentUserDocument?.stripeId,
                                            '') !=
                                        '') {
                                  if (valueOrDefault(
                                          currentUserDocument?.balance, 0.0) >=
                                      _model.totalPrice!) {
                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'balance': FieldValue.increment(
                                              -(_model.totalPrice!)),
                                        },
                                      ),
                                    });

                                    var reservationsRecordReference1 =
                                        ReservationsRecord.createDoc(
                                            currentUserReference!);
                                    await reservationsRecordReference1
                                        .set(createReservationsRecordData(
                                      reservationDate:
                                          functions.dateTimeFromDateAndTime(
                                              _model.datePicked!,
                                              _model.time1!),
                                      reservationPrice: _model.totalPrice,
                                      reservationEndDate:
                                          functions.dateTimeFromDateAndTime(
                                              _model.datePicked!,
                                              _model.time2!),
                                      status: 'completed',
                                      paymentIntentId: 'account_balance',
                                      createdDate: getCurrentTimestamp,
                                      withBalance: true,
                                      balanceAmount: _model.totalPrice,
                                      groomingRef: widget.daycare,
                                      programRefg: _model.selectedProgramIndex,
                                    ));
                                    _model.reservationb =
                                        ReservationsRecord.getDocumentFromData(
                                            createReservationsRecordData(
                                              reservationDate: functions
                                                  .dateTimeFromDateAndTime(
                                                      _model.datePicked!,
                                                      _model.time1!),
                                              reservationPrice:
                                                  _model.totalPrice,
                                              reservationEndDate: functions
                                                  .dateTimeFromDateAndTime(
                                                      _model.datePicked!,
                                                      _model.time2!),
                                              status: 'completed',
                                              paymentIntentId:
                                                  'account_balance',
                                              createdDate: getCurrentTimestamp,
                                              withBalance: true,
                                              balanceAmount: _model.totalPrice,
                                              groomingRef: widget.daycare,
                                              programRefg:
                                                  _model.selectedProgramIndex,
                                            ),
                                            reservationsRecordReference1);

                                    context.pushNamed(
                                      'paymentConf',
                                      queryParameters: {
                                        'amount': serializeParam(
                                          _model.totalPrice,
                                          ParamType.double,
                                        ),
                                        'paymentIntent': serializeParam(
                                          'account_balance',
                                          ParamType.String,
                                        ),
                                        'reservation': serializeParam(
                                          _model.reservationb?.reference,
                                          ParamType.DocumentReference,
                                        ),
                                        'connectedAccount': serializeParam(
                                          bookingGroomingGroomingRecord
                                              .connectedAccountId,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    if (_model.selectedPayment != null) {
                                      if (valueOrDefault(
                                              currentUserDocument?.balance,
                                              0.0) >
                                          0.0) {
                                        _model.payb = await StripeApiGroup
                                            .makePaymentCall
                                            .call(
                                          amount: functions.amountToCent(
                                              _model.cardCharges!),
                                          customer: valueOrDefault(
                                              currentUserDocument?.stripeId,
                                              ''),
                                          paymentMethod: _model
                                              .selectedPayment?.paymentMethodId,
                                        );

                                        if ((_model.payb?.succeeded ?? true)) {
                                          if (StripeApiGroup.makePaymentCall
                                                  .status(
                                                (_model.payb?.jsonBody ?? ''),
                                              ) ==
                                              'succeeded') {
                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'balance': FieldValue.increment(
                                                      -(functions.difference(
                                                          _model.totalPrice!,
                                                          _model
                                                              .cardCharges!))),
                                                },
                                              ),
                                            });

                                            var reservationsRecordReference2 =
                                                ReservationsRecord.createDoc(
                                                    currentUserReference!);
                                            await reservationsRecordReference2
                                                .set(
                                                    createReservationsRecordData(
                                              reservationDate: functions
                                                  .dateTimeFromDateAndTime(
                                                      _model.datePicked!,
                                                      _model.time1!),
                                              reservationPrice:
                                                  _model.totalPrice,
                                              paymentUsed: _model
                                                  .selectedPayment?.reference,
                                              reservationEndDate: functions
                                                  .dateTimeFromDateAndTime(
                                                      _model.datePicked!,
                                                      _model.time2!),
                                              status: 'completed',
                                              paymentIntentId: StripeApiGroup
                                                  .makePaymentCall
                                                  .id(
                                                (_model.payb?.jsonBody ?? ''),
                                              ),
                                              createdDate: getCurrentTimestamp,
                                              withBalance: true,
                                              balanceAmount:
                                                  functions.difference(
                                                      _model.totalPrice!,
                                                      _model.cardCharges!),
                                              groomingRef: widget.daycare,
                                              programRefg:
                                                  _model.selectedProgramIndex,
                                            ));
                                            _model.reservation1b = ReservationsRecord
                                                .getDocumentFromData(
                                                    createReservationsRecordData(
                                                      reservationDate: functions
                                                          .dateTimeFromDateAndTime(
                                                              _model
                                                                  .datePicked!,
                                                              _model.time1!),
                                                      reservationPrice:
                                                          _model.totalPrice,
                                                      paymentUsed: _model
                                                          .selectedPayment
                                                          ?.reference,
                                                      reservationEndDate: functions
                                                          .dateTimeFromDateAndTime(
                                                              _model
                                                                  .datePicked!,
                                                              _model.time2!),
                                                      status: 'completed',
                                                      paymentIntentId:
                                                          StripeApiGroup
                                                              .makePaymentCall
                                                              .id(
                                                        (_model.payb
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      createdDate:
                                                          getCurrentTimestamp,
                                                      withBalance: true,
                                                      balanceAmount:
                                                          functions.difference(
                                                              _model
                                                                  .totalPrice!,
                                                              _model
                                                                  .cardCharges!),
                                                      groomingRef:
                                                          widget.daycare,
                                                      programRefg: _model
                                                          .selectedProgramIndex,
                                                    ),
                                                    reservationsRecordReference2);

                                            context.pushNamed(
                                              'paymentConf',
                                              queryParameters: {
                                                'payment': serializeParam(
                                                  _model.selectedPayment
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'amount': serializeParam(
                                                  _model.totalPrice,
                                                  ParamType.double,
                                                ),
                                                'paymentIntent': serializeParam(
                                                  StripeApiGroup.makePaymentCall
                                                      .id(
                                                    (_model.payb?.jsonBody ??
                                                        ''),
                                                  ),
                                                  ParamType.String,
                                                ),
                                                'reservation': serializeParam(
                                                  _model
                                                      .reservation1b?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'connectedAccount':
                                                    serializeParam(
                                                  bookingGroomingGroomingRecord
                                                      .connectedAccountId,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            if (StripeApiGroup.makePaymentCall
                                                    .status(
                                                  (_model.payb?.jsonBody ?? ''),
                                                ) ==
                                                'requires_confirmation') {
                                              var reservationsRecordReference3 =
                                                  ReservationsRecord.createDoc(
                                                      currentUserReference!);
                                              await reservationsRecordReference3
                                                  .set(
                                                      createReservationsRecordData(
                                                reservationDate: functions
                                                    .dateTimeFromDateAndTime(
                                                        _model.datePicked!,
                                                        _model.time1!),
                                                reservationPrice:
                                                    _model.totalPrice,
                                                paymentUsed: _model
                                                    .selectedPayment?.reference,
                                                reservationEndDate: functions
                                                    .dateTimeFromDateAndTime(
                                                        _model.datePicked!,
                                                        _model.time2!),
                                                status: 'pending',
                                                paymentIntentId: StripeApiGroup
                                                    .makePaymentCall
                                                    .id(
                                                  (_model.payb?.jsonBody ?? ''),
                                                ),
                                                createdDate:
                                                    getCurrentTimestamp,
                                                withBalance: true,
                                                balanceAmount:
                                                    functions.difference(
                                                        _model.totalPrice!,
                                                        _model.cardCharges!),
                                                groomingRef: widget.daycare,
                                                programRefg:
                                                    _model.selectedProgramIndex,
                                              ));
                                              _model.reservatin1b = ReservationsRecord
                                                  .getDocumentFromData(
                                                      createReservationsRecordData(
                                                        reservationDate: functions
                                                            .dateTimeFromDateAndTime(
                                                                _model
                                                                    .datePicked!,
                                                                _model.time1!),
                                                        reservationPrice:
                                                            _model.totalPrice,
                                                        paymentUsed: _model
                                                            .selectedPayment
                                                            ?.reference,
                                                        reservationEndDate: functions
                                                            .dateTimeFromDateAndTime(
                                                                _model
                                                                    .datePicked!,
                                                                _model.time2!),
                                                        status: 'pending',
                                                        paymentIntentId:
                                                            StripeApiGroup
                                                                .makePaymentCall
                                                                .id(
                                                          (_model.payb
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        createdDate:
                                                            getCurrentTimestamp,
                                                        withBalance: true,
                                                        balanceAmount: functions
                                                            .difference(
                                                                _model
                                                                    .totalPrice!,
                                                                _model
                                                                    .cardCharges!),
                                                        groomingRef:
                                                            widget.daycare,
                                                        programRefg: _model
                                                            .selectedProgramIndex,
                                                      ),
                                                      reservationsRecordReference3);
                                              _model.confirmPaymentb =
                                                  await StripeApiGroup
                                                      .confirmPaymentCall
                                                      .call(
                                                returnUrl:
                                                    'woofurbetaapp://woofurbetaapp.com/paymentConf?payment=${_model.selectedPayment?.reference.id}&amount=${_model.totalPrice?.toString()}&paymentIntent=${StripeApiGroup.makePaymentCall.id(
                                                  (_model.payb?.jsonBody ?? ''),
                                                )}&reservation=${_model.reservatin1b?.reference.id}&connectedAccount=${bookingGroomingGroomingRecord.connectedAccountId}',
                                                paymentMethodID: valueOrDefault(
                                                    currentUserDocument
                                                        ?.stripePaymentId,
                                                    ''),
                                                paymentIntent: StripeApiGroup
                                                    .makePaymentCall
                                                    .id(
                                                  (_model.payb?.jsonBody ?? ''),
                                                ),
                                              );

                                              if (StripeApiGroup
                                                      .confirmPaymentCall
                                                      .status(
                                                    (_model.confirmPaymentb
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  'succeeded') {
                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'balance': FieldValue.increment(
                                                          -(functions.difference(
                                                              _model
                                                                  .totalPrice!,
                                                              _model
                                                                  .cardCharges!))),
                                                    },
                                                  ),
                                                });

                                                await _model
                                                    .reservatin1b!.reference
                                                    .update(
                                                        createReservationsRecordData(
                                                  status: 'completed',
                                                ));

                                                context.pushNamed(
                                                  'paymentConf',
                                                  queryParameters: {
                                                    'payment': serializeParam(
                                                      _model.selectedPayment
                                                          ?.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'amount': serializeParam(
                                                      _model.totalPrice,
                                                      ParamType.double,
                                                    ),
                                                    'paymentIntent':
                                                        serializeParam(
                                                      StripeApiGroup
                                                          .makePaymentCall
                                                          .id(
                                                        (_model.payb
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                    'reservation':
                                                        serializeParam(
                                                      _model.reservatin1b
                                                          ?.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'connectedAccount':
                                                        serializeParam(
                                                      bookingGroomingGroomingRecord
                                                          .connectedAccountId,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                await launchURL(StripeApiGroup
                                                    .confirmPaymentCall
                                                    .url(
                                                  (_model.confirmPaymentb
                                                          ?.jsonBody ??
                                                      ''),
                                                )!);
                                              }
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Error initiating booking, ',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Error initiating booking, ${StripeApiGroup.makePaymentCall.errorMessage(
                                                  (_model.payb?.jsonBody ?? ''),
                                                )}',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        }
                                      } else {
                                        _model.pay = await StripeApiGroup
                                            .makePaymentCall
                                            .call(
                                          amount: functions
                                              .amountToCent(_model.totalPrice!),
                                          customer: valueOrDefault(
                                              currentUserDocument?.stripeId,
                                              ''),
                                          paymentMethod: _model
                                              .selectedPayment?.paymentMethodId,
                                        );

                                        if ((_model.pay?.succeeded ?? true)) {
                                          if (StripeApiGroup.makePaymentCall
                                                  .status(
                                                (_model.pay?.jsonBody ?? ''),
                                              ) ==
                                              'succeeded') {
                                            var reservationsRecordReference4 =
                                                ReservationsRecord.createDoc(
                                                    currentUserReference!);
                                            await reservationsRecordReference4
                                                .set(
                                                    createReservationsRecordData(
                                              reservationDate: functions
                                                  .dateTimeFromDateAndTime(
                                                      _model.datePicked!,
                                                      _model.time1!),
                                              reservationPrice:
                                                  _model.totalPrice,
                                              paymentUsed: _model
                                                  .selectedPayment?.reference,
                                              reservationEndDate: functions
                                                  .dateTimeFromDateAndTime(
                                                      _model.datePicked!,
                                                      _model.time2!),
                                              status: 'completed',
                                              paymentIntentId: StripeApiGroup
                                                  .makePaymentCall
                                                  .id(
                                                (_model.pay?.jsonBody ?? ''),
                                              ),
                                              createdDate: getCurrentTimestamp,
                                              groomingRef: widget.daycare,
                                              programRefg:
                                                  _model.selectedProgramIndex,
                                            ));
                                            _model.reservation1 = ReservationsRecord
                                                .getDocumentFromData(
                                                    createReservationsRecordData(
                                                      reservationDate: functions
                                                          .dateTimeFromDateAndTime(
                                                              _model
                                                                  .datePicked!,
                                                              _model.time1!),
                                                      reservationPrice:
                                                          _model.totalPrice,
                                                      paymentUsed: _model
                                                          .selectedPayment
                                                          ?.reference,
                                                      reservationEndDate: functions
                                                          .dateTimeFromDateAndTime(
                                                              _model
                                                                  .datePicked!,
                                                              _model.time2!),
                                                      status: 'completed',
                                                      paymentIntentId:
                                                          StripeApiGroup
                                                              .makePaymentCall
                                                              .id(
                                                        (_model.pay?.jsonBody ??
                                                            ''),
                                                      ),
                                                      createdDate:
                                                          getCurrentTimestamp,
                                                      groomingRef:
                                                          widget.daycare,
                                                      programRefg: _model
                                                          .selectedProgramIndex,
                                                    ),
                                                    reservationsRecordReference4);

                                            context.pushNamed(
                                              'paymentConf',
                                              queryParameters: {
                                                'payment': serializeParam(
                                                  _model.selectedPayment
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'amount': serializeParam(
                                                  _model.totalPrice,
                                                  ParamType.double,
                                                ),
                                                'paymentIntent': serializeParam(
                                                  StripeApiGroup.makePaymentCall
                                                      .id(
                                                    (_model.pay?.jsonBody ??
                                                        ''),
                                                  ),
                                                  ParamType.String,
                                                ),
                                                'reservation': serializeParam(
                                                  _model
                                                      .reservation1?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'connectedAccount':
                                                    serializeParam(
                                                  bookingGroomingGroomingRecord
                                                      .connectedAccountId,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            if (StripeApiGroup.makePaymentCall
                                                    .status(
                                                  (_model.pay?.jsonBody ?? ''),
                                                ) ==
                                                'requires_confirmation') {
                                              var reservationsRecordReference5 =
                                                  ReservationsRecord.createDoc(
                                                      currentUserReference!);
                                              await reservationsRecordReference5
                                                  .set(
                                                      createReservationsRecordData(
                                                reservationDate: functions
                                                    .dateTimeFromDateAndTime(
                                                        _model.datePicked!,
                                                        _model.time1!),
                                                reservationPrice:
                                                    _model.totalPrice,
                                                paymentUsed: _model
                                                    .selectedPayment?.reference,
                                                reservationEndDate: functions
                                                    .dateTimeFromDateAndTime(
                                                        _model.datePicked!,
                                                        _model.time2!),
                                                status: 'pending',
                                                paymentIntentId: StripeApiGroup
                                                    .makePaymentCall
                                                    .id(
                                                  (_model.pay?.jsonBody ?? ''),
                                                ),
                                                createdDate:
                                                    getCurrentTimestamp,
                                                groomingRef: widget.daycare,
                                                programRefg:
                                                    _model.selectedProgramIndex,
                                              ));
                                              _model.reservatin1 = ReservationsRecord
                                                  .getDocumentFromData(
                                                      createReservationsRecordData(
                                                        reservationDate: functions
                                                            .dateTimeFromDateAndTime(
                                                                _model
                                                                    .datePicked!,
                                                                _model.time1!),
                                                        reservationPrice:
                                                            _model.totalPrice,
                                                        paymentUsed: _model
                                                            .selectedPayment
                                                            ?.reference,
                                                        reservationEndDate: functions
                                                            .dateTimeFromDateAndTime(
                                                                _model
                                                                    .datePicked!,
                                                                _model.time2!),
                                                        status: 'pending',
                                                        paymentIntentId:
                                                            StripeApiGroup
                                                                .makePaymentCall
                                                                .id(
                                                          (_model.pay
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        createdDate:
                                                            getCurrentTimestamp,
                                                        groomingRef:
                                                            widget.daycare,
                                                        programRefg: _model
                                                            .selectedProgramIndex,
                                                      ),
                                                      reservationsRecordReference5);
                                              _model.confirmPayment =
                                                  await StripeApiGroup
                                                      .confirmPaymentCall
                                                      .call(
                                                returnUrl:
                                                    'woofurbetaapp://woofurbetaapp.com/paymentConf?payment=${_model.selectedPayment?.reference.id}&amount=${_model.totalPrice?.toString()}&paymentIntent=${StripeApiGroup.makePaymentCall.id(
                                                  (_model.pay?.jsonBody ?? ''),
                                                )}&reservation=${_model.reservatin1?.reference.id}&connectedAccount=${bookingGroomingGroomingRecord.connectedAccountId}',
                                                paymentMethodID: valueOrDefault(
                                                    currentUserDocument
                                                        ?.stripePaymentId,
                                                    ''),
                                                paymentIntent: StripeApiGroup
                                                    .makePaymentCall
                                                    .id(
                                                  (_model.pay?.jsonBody ?? ''),
                                                ),
                                              );

                                              if (StripeApiGroup
                                                      .confirmPaymentCall
                                                      .status(
                                                    (_model.confirmPayment
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  'succeeded') {
                                                context.pushNamed(
                                                  'paymentConf',
                                                  queryParameters: {
                                                    'payment': serializeParam(
                                                      _model.selectedPayment
                                                          ?.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'amount': serializeParam(
                                                      _model.totalPrice,
                                                      ParamType.double,
                                                    ),
                                                    'paymentIntent':
                                                        serializeParam(
                                                      StripeApiGroup
                                                          .makePaymentCall
                                                          .id(
                                                        (_model.pay?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                    'reservation':
                                                        serializeParam(
                                                      _model.reservatin1
                                                          ?.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'connectedAccount':
                                                        serializeParam(
                                                      bookingGroomingGroomingRecord
                                                          .connectedAccountId,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                await launchURL(StripeApiGroup
                                                    .confirmPaymentCall
                                                    .url(
                                                  (_model.confirmPayment
                                                          ?.jsonBody ??
                                                      ''),
                                                )!);
                                              }
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Error initiating booking, ',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Error initiating booking, ${StripeApiGroup.makePaymentCall.errorMessage(
                                                  (_model.pay?.jsonBody ?? ''),
                                                )}',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        }
                                      }
                                    } else {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: StripeFormCardWidget(
                                                callback: (paymentMethodId,
                                                    cardDetails) async {
                                                  _model.addPaymentMethodToCustomer1 =
                                                      await StripeApiGroup
                                                          .addPaymentMethodToCustomerCall
                                                          .call(
                                                    customer: valueOrDefault(
                                                        currentUserDocument
                                                            ?.stripeId,
                                                        ''),
                                                    paymentMethod:
                                                        paymentMethodId,
                                                  );

                                                  if ((_model
                                                          .addPaymentMethodToCustomer1
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.pmAsDefault =
                                                        await StripeApiGroup
                                                            .setPaymentMethodDefaultCall
                                                            .call(
                                                      customerID: valueOrDefault(
                                                          currentUserDocument
                                                              ?.stripeId,
                                                          ''),
                                                      paymentMethodID:
                                                          paymentMethodId,
                                                    );

                                                    if ((_model.pmAsDefault
                                                            ?.succeeded ??
                                                        true)) {
                                                      await currentUserReference!
                                                          .update(
                                                              createUsersRecordData(
                                                        stripePaymentId:
                                                            paymentMethodId,
                                                        setPmAsDefault: true,
                                                      ));

                                                      var paymentsRecordReference =
                                                          PaymentsRecord.createDoc(
                                                              currentUserReference!);
                                                      await paymentsRecordReference
                                                          .set(
                                                              createPaymentsRecordData(
                                                        cardNumber:
                                                            cardDetails?.last4,
                                                        country: cardDetails
                                                            ?.country,
                                                        paymentMethodId:
                                                            paymentMethodId,
                                                        nameOnCard:
                                                            cardDetails?.name,
                                                        expiration: functions
                                                            .dateFromMonthYear(
                                                                cardDetails!
                                                                    .expMonth,
                                                                cardDetails
                                                                    .expYear),
                                                        city: cardDetails.city,
                                                        billingAddress:
                                                            cardDetails
                                                                .address,
                                                        state:
                                                            cardDetails.state,
                                                        zipCode: cardDetails
                                                            .zipCode,
                                                        brand:
                                                            cardDetails.brand,
                                                      ));
                                                      _model.card = PaymentsRecord
                                                          .getDocumentFromData(
                                                              createPaymentsRecordData(
                                                                cardNumber:
                                                                    cardDetails
                                                                        .last4,
                                                                country:
                                                                    cardDetails
                                                                        .country,
                                                                paymentMethodId:
                                                                    paymentMethodId,
                                                                nameOnCard:
                                                                    cardDetails
                                                                        .name,
                                                                expiration: functions.dateFromMonthYear(
                                                                    cardDetails
                                                                        .expMonth,
                                                                    cardDetails
                                                                        .expYear),
                                                                city:
                                                                    cardDetails
                                                                        .city,
                                                                billingAddress:
                                                                    cardDetails
                                                                        .address,
                                                                state:
                                                                    cardDetails
                                                                        .state,
                                                                zipCode:
                                                                    cardDetails
                                                                        .zipCode,
                                                                brand:
                                                                    cardDetails
                                                                        .brand,
                                                              ),
                                                              paymentsRecordReference);
                                                      _model.selectedPayment =
                                                          _model.card;
                                                      safeSetState(() {});
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'payment added successfully!',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Error adding payment, ${StripeApiGroup.setPaymentMethodDefaultCall.errorMessage(
                                                                  (_model.pmAsDefault
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ).toString()}',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Error adding payment, ${StripeApiGroup.addPaymentMethodToCustomerCall.errorMessage(
                                                            (_model.addPaymentMethodToCustomer1
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )}',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: const Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    }
                                  }
                                } else {
                                  _model.createCustomer = await StripeApiGroup
                                      .createCustomerCall
                                      .call(
                                    name: currentUserDisplayName,
                                    email: currentUserEmail,
                                  );

                                  if ((_model.createCustomer?.succeeded ??
                                      true)) {
                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      stripeId:
                                          StripeApiGroup.createCustomerCall.id(
                                        (_model.createCustomer?.jsonBody ?? ''),
                                      ),
                                    ));
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(context).unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: StripeFormCardWidget(
                                              callback: (paymentMethodId,
                                                  cardDetails) async {
                                                _model.addPaymentMethodToCustomer2 =
                                                    await StripeApiGroup
                                                        .addPaymentMethodToCustomerCall
                                                        .call(
                                                  customer: valueOrDefault(
                                                      currentUserDocument
                                                          ?.stripeId,
                                                      ''),
                                                  paymentMethod:
                                                      paymentMethodId,
                                                );

                                                if ((_model
                                                        .addPaymentMethodToCustomer2
                                                        ?.succeeded ??
                                                    true)) {
                                                  _model.setPaymentMethodDefault12 =
                                                      await StripeApiGroup
                                                          .setPaymentMethodDefaultCall
                                                          .call(
                                                    customerID: valueOrDefault(
                                                        currentUserDocument
                                                            ?.stripeId,
                                                        ''),
                                                    paymentMethodID:
                                                        paymentMethodId,
                                                  );

                                                  if ((_model
                                                          .setPaymentMethodDefault12
                                                          ?.succeeded ??
                                                      true)) {
                                                    await currentUserReference!
                                                        .update(
                                                            createUsersRecordData(
                                                      stripePaymentId:
                                                          paymentMethodId,
                                                      setPmAsDefault: true,
                                                    ));

                                                    var paymentsRecordReference =
                                                        PaymentsRecord.createDoc(
                                                            currentUserReference!);
                                                    await paymentsRecordReference
                                                        .set(
                                                            createPaymentsRecordData(
                                                      cardNumber:
                                                          cardDetails?.last4,
                                                      country:
                                                          cardDetails?.country,
                                                      paymentMethodId:
                                                          paymentMethodId,
                                                      nameOnCard:
                                                          cardDetails?.name,
                                                      expiration: functions
                                                          .dateFromMonthYear(
                                                              cardDetails!
                                                                  .expMonth,
                                                              cardDetails
                                                                  .expYear),
                                                      city: cardDetails.city,
                                                      billingAddress:
                                                          cardDetails.address,
                                                      state: cardDetails.state,
                                                      zipCode:
                                                          cardDetails.zipCode,
                                                      brand: cardDetails.brand,
                                                    ));
                                                    _model.card1 = PaymentsRecord
                                                        .getDocumentFromData(
                                                            createPaymentsRecordData(
                                                              cardNumber:
                                                                  cardDetails
                                                                      .last4,
                                                              country:
                                                                  cardDetails
                                                                      .country,
                                                              paymentMethodId:
                                                                  paymentMethodId,
                                                              nameOnCard:
                                                                  cardDetails
                                                                      .name,
                                                              expiration: functions
                                                                  .dateFromMonthYear(
                                                                      cardDetails
                                                                          .expMonth,
                                                                      cardDetails
                                                                          .expYear),
                                                              city: cardDetails
                                                                  .city,
                                                              billingAddress:
                                                                  cardDetails
                                                                      .address,
                                                              state: cardDetails
                                                                  .state,
                                                              zipCode:
                                                                  cardDetails
                                                                      .zipCode,
                                                              brand: cardDetails
                                                                  .brand,
                                                            ),
                                                            paymentsRecordReference);
                                                    _model.selectedPayment =
                                                        _model.card1;
                                                    safeSetState(() {});
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'payment added successfully!',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: const Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Error adding payment, ${StripeApiGroup.setPaymentMethodDefaultCall.errorMessage(
                                                                (_model.setPaymentMethodDefault12
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString()}',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: const Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Error adding payment, ${StripeApiGroup.addPaymentMethodToCustomerCall.errorMessage(
                                                          (_model.addPaymentMethodToCustomer2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Error initiating booking, ${StripeApiGroup.createCustomerCall.errorMessage(
                                                (_model.createCustomer
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString()}',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }
                                }

                                safeSetState(() {});
                              },
                        text: (_model.totalPrice! >
                                    valueOrDefault(
                                        currentUserDocument?.balance, 0.0)
                                ? (_model.selectedPayment != null)
                                : true)
                            ? 'Confirm Payment'
                            : 'Add payment details',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
