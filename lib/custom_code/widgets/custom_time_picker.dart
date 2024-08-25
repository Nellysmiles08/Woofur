// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({
    super.key,
    this.width,
    this.height,
    required this.currentTime,
    required this.time,
    required this.setTime,
    required this.defaultText,
  });

  final double? width;
  final double? height;
  final DateTime currentTime;
  final DateTime? time;
  final Future Function(DateTime newTime) setTime;
  final String defaultText;

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1, 0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await showModalBottomSheet<bool>(
            context: context,
            builder: (context) {
              final _datePicked3CupertinoTheme = CupertinoTheme.of(context);
              return ScrollConfiguration(
                behavior: const MaterialScrollBehavior().copyWith(
                  dragDevices: {
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.touch,
                    PointerDeviceKind.stylus,
                    PointerDeviceKind.unknown
                  },
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  child: CupertinoTheme(
                    data: _datePicked3CupertinoTheme.copyWith(
                      textTheme: _datePicked3CupertinoTheme.textTheme.copyWith(
                        dateTimePickerTextStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      minimumDate: DateTime(1900),
                      initialDateTime: getCurrentTimestamp,
                      maximumDate: DateTime(2050),
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      use24hFormat: false,
                      onDateTimeChanged: widget.setTime,
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          width: double.infinity,
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
          child: Align(
            alignment: AlignmentDirectional(-1, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Text(
                valueOrDefault<String>(
                  dateTimeFormat('jm', widget.time),
                  widget.defaultText,
                ),
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 16,
                      letterSpacing: 0,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
