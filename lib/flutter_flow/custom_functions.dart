import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double priceCalculator(
  DateTime? startTIme,
  DateTime? endTIme,
  double? price,
  double? percent,
) {
  // Create the total price using the hourly price and user input of start time and end time
  if (startTIme == null ||
      endTIme == null ||
      price == null ||
      percent == null) {
    return 0.0;
  }
  final duration = endTIme.difference(startTIme);
  final days = duration.inDays <= 0
      ? 1
      : duration.inDays; // Ensure at least 1 day if duration is 0 or negative
  final totalPrice = days * price;
  final tax = totalPrice * (percent / 100);
  return totalPrice + tax;
}

int daysCalculator(
  DateTime? startTime,
  DateTime? endTime,
) {
  // calculate the difference in hours between two variable times in X hours and Y minutes format
  if (startTime == null || endTime == null) {
    return 0;
  }

  final difference = endTime.difference(startTime);
  final day = difference.inDays;
  if (day < 1) {
    return 1;
  }
  return day;
}

List<DateTime> getSlots(
  List<DateTime> reservSlot,
  DateTime date,
) {
  List<DateTime> available_booking = [];
  DateTime now = date;
  DateTime startTime = DateTime(now.year, now.month, now.day, now.hour, 0);
  DateTime endTime = startTime.add(Duration(days: 2));
  bool isReserved;

  for (DateTime currentTime = startTime;
      currentTime.isBefore(endTime);
      currentTime = currentTime.add(Duration(hours: 1))) {
    isReserved = false;

    for (DateTime revSlot in reservSlot) {
      if (currentTime.year == revSlot.year &&
          currentTime.day == revSlot.day &&
          currentTime.hour == revSlot.hour &&
          currentTime.minute == revSlot.minute) {
        isReserved = true;
        break;
      }
    }

    if (!isReserved && currentTime.hour >= 9 && currentTime.hour <= 13) {
      available_booking.add(currentTime);
    }
  }

  List<DateTime> available_slot = available_booking
      .where((DateTime dt) => dt.day == available_booking[0].day)
      .toList();
  return available_slot;
}

int addOneToInt(int num) {
  // add 1 to an integer and return the sum
  return num + 1;
}

DateTime dateFromMonthYear(
  int month,
  int year,
) {
  return (DateTime(year, month = month));
}

int amountToCent(double amount) {
  return (amount * 100).toInt();
}

DateTime tomorrow() {
  final today = DateTime.now();

  return today.add(Duration(days: 1));
}

double? appFeeCalc(double price) {
  return price * (.5);
}

String? printValue(String value) {
  print("value: ${value}");
  return value;
}

DocumentReference paymentRefWithUsers(
  String value,
  String parentRefID,
) {
  final parent =
      FirebaseFirestore.instance.collection("users").doc(parentRefID);
  final ref = parent.collection("payments");
  return ref.doc(value);
}

DocumentReference reservationRefWithUser(
  String value,
  String userRefID,
) {
  final parent = FirebaseFirestore.instance.collection("users").doc(userRefID);
  final ref = parent.collection("reservations");
  return ref.doc(value);
}

double seperatePayment(
  double balance,
  double payment,
) {
  var diff = payment - balance;
  if (diff >= .5) {
    return diff;
  }
  return .5;
}

double difference(
  double value1,
  double value2,
) {
  return value1 - value2;
}

double priceCalculatorWithoutTax(
  DateTime? startTIme,
  DateTime? endTIme,
  double? price,
) {
  // Create the total price using the hourly price and user input of start time and end time
  if (startTIme == null || endTIme == null || price == null) {
    return 0.0;
  }
  final duration = endTIme.difference(startTIme);
  final days = duration.inDays <= 0
      ? 1
      : duration.inDays; // Ensure at least 1 day if duration is 0 or negative
  final totalPrice = days * price;
  return totalPrice;
}

double priceCalculatorTax(
  DateTime? startTIme,
  DateTime? endTIme,
  double? price,
  double percent,
) {
  // Create the total price using the hourly price and user input of start time and end time
  if (startTIme == null || endTIme == null || price == null) {
    return 0.0;
  }
  final duration = endTIme.difference(startTIme);
  final days = duration.inDays <= 0
      ? 1
      : duration.inDays; // Ensure at least 1 day if duration is 0 or negative
  final totalPrice = days * price;
  final tax = totalPrice * (percent / 100);
  return tax;
}

int getTimeout(DateTime date) {
  final today = DateTime.now();
  final compare = date.compareTo(today);
  if (compare > 0) {
    final diff = date.difference(today);
    return diff.inSeconds;
  }
  return 60;
}

bool allowRefund(DateTime reservationStartDate) {
  final today = DateTime.now();
  final diff = reservationStartDate.difference(today);
  if (diff.inHours >= 24) {
    return true;
  }
  return false;
}

double paymentBalance(
  double payment,
  double balance,
) {
  final diff = payment - balance;
  if (diff > 0) {
    return diff;
  }
  return 0.0;
}

DocumentReference petWithUserRef(
  String value,
  String parentRefID,
) {
  final parent =
      FirebaseFirestore.instance.collection("users").doc(parentRefID);
  final ref = parent.collection("pets");
  return ref.doc(value);
}

double groomingPriceCalculator(
  ProgramRecord? program,
  double? tax,
) {
  if (program != null) {
    final price = program.price;
    final taxAmount = price * ((tax ?? 0) / 100);
    return price + taxAmount;
  }
  return 0.0;
}

double calculateTax(
  double? amount,
  double? taxInPercent,
) {
  final a = amount ?? 0.0;
  final t = (taxInPercent ?? 0.0) / 100;
  return a * t;
}

DateTime dateTimeFromDateAndTime(
  DateTime date,
  DateTime time,
) {
  return DateTime(date.year, date.month, date.day, time.hour, time.minute);
}

double toTwoDecimalPlaces(double? value) {
  if (value != null) {
    final power = math.pow(10, 2);
    final scaledValue = value * power;
    final roundedValue = scaledValue.ceil();
    return roundedValue / power;
  }
  return 0.0;
}
