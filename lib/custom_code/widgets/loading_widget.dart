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

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({
    super.key,
    this.width,
    this.height,
    this.strokeColor,
    this.strokeWidth,
    this.radius,
  });

  final double? width;
  final double? height;
  final Color? strokeColor;
  final double? strokeWidth;
  final double? radius;

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.radius ?? 200,
        height: widget.radius ?? 200,
        child: CircularProgressIndicator(
          strokeWidth: widget.strokeWidth ?? 8.0,
          color: widget.strokeColor,
        ),
      ),
    );
  }
}
