// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AvailibilityStruct extends FFFirebaseStruct {
  AvailibilityStruct({
    String? dayofweek,
    String? startTime,
    String? endTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dayofweek = dayofweek,
        _startTime = startTime,
        _endTime = endTime,
        super(firestoreUtilData);

  // "dayofweek" field.
  String? _dayofweek;
  String get dayofweek => _dayofweek ?? 'weekday';
  set dayofweek(String? val) => _dayofweek = val;

  bool hasDayofweek() => _dayofweek != null;

  // "startTime" field.
  String? _startTime;
  String get startTime => _startTime ?? '8:00am';
  set startTime(String? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  String? _endTime;
  String get endTime => _endTime ?? '6:00pm';
  set endTime(String? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  static AvailibilityStruct fromMap(Map<String, dynamic> data) =>
      AvailibilityStruct(
        dayofweek: data['dayofweek'] as String?,
        startTime: data['startTime'] as String?,
        endTime: data['endTime'] as String?,
      );

  static AvailibilityStruct? maybeFromMap(dynamic data) => data is Map
      ? AvailibilityStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dayofweek': _dayofweek,
        'startTime': _startTime,
        'endTime': _endTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dayofweek': serializeParam(
          _dayofweek,
          ParamType.String,
        ),
        'startTime': serializeParam(
          _startTime,
          ParamType.String,
        ),
        'endTime': serializeParam(
          _endTime,
          ParamType.String,
        ),
      }.withoutNulls;

  static AvailibilityStruct fromSerializableMap(Map<String, dynamic> data) =>
      AvailibilityStruct(
        dayofweek: deserializeParam(
          data['dayofweek'],
          ParamType.String,
          false,
        ),
        startTime: deserializeParam(
          data['startTime'],
          ParamType.String,
          false,
        ),
        endTime: deserializeParam(
          data['endTime'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AvailibilityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AvailibilityStruct &&
        dayofweek == other.dayofweek &&
        startTime == other.startTime &&
        endTime == other.endTime;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([dayofweek, startTime, endTime]);
}

AvailibilityStruct createAvailibilityStruct({
  String? dayofweek,
  String? startTime,
  String? endTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AvailibilityStruct(
      dayofweek: dayofweek,
      startTime: startTime,
      endTime: endTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AvailibilityStruct? updateAvailibilityStruct(
  AvailibilityStruct? availibility, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    availibility
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAvailibilityStructData(
  Map<String, dynamic> firestoreData,
  AvailibilityStruct? availibility,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (availibility == null) {
    return;
  }
  if (availibility.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && availibility.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final availibilityData =
      getAvailibilityFirestoreData(availibility, forFieldValue);
  final nestedData =
      availibilityData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = availibility.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAvailibilityFirestoreData(
  AvailibilityStruct? availibility, [
  bool forFieldValue = false,
]) {
  if (availibility == null) {
    return {};
  }
  final firestoreData = mapToFirestore(availibility.toMap());

  // Add any Firestore field values
  availibility.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAvailibilityListFirestoreData(
  List<AvailibilityStruct>? availibilitys,
) =>
    availibilitys?.map((e) => getAvailibilityFirestoreData(e, true)).toList() ??
    [];
