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

class DateFromDropdown extends StatefulWidget {
  const DateFromDropdown({
    super.key,
    this.width,
    this.height,
    this.startDate,
    this.endDate,
    this.initialDate,
    required this.setDate,
  });

  final double? width;
  final double? height;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? initialDate;
  final Future Function(DateTime? date) setDate;

  @override
  State<DateFromDropdown> createState() => _DateFromDropdownState();
}

class _DateFromDropdownState extends State<DateFromDropdown> {
  String? pDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: DropdownButton<DateTime>(
          hint: Text('Choose A Date'),
          items: [pDate ?? 'Choose a Date']
              .map((e) => DropdownMenuItem<DateTime>(child: Text(e)))
              .toList(),
          onChanged: (DateTime? value) {
            setState(() {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2001),
                      lastDate: DateTime(2099))
                  .then((date) {
                widget.setDate(date);
              });
            });
          }),
    );
  }
}
