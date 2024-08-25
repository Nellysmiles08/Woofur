import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IsFacilityManagerRecord extends FirestoreRecord {
  IsFacilityManagerRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "EmailAddress" field.
  String? _emailAddress;
  String get emailAddress => _emailAddress ?? '';
  bool hasEmailAddress() => _emailAddress != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "ConfirmPassword" field.
  String? _confirmPassword;
  String get confirmPassword => _confirmPassword ?? '';
  bool hasConfirmPassword() => _confirmPassword != null;

  void _initializeFields() {
    _emailAddress = snapshotData['EmailAddress'] as String?;
    _password = snapshotData['password'] as String?;
    _confirmPassword = snapshotData['ConfirmPassword'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('isFacilityManager');

  static Stream<IsFacilityManagerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IsFacilityManagerRecord.fromSnapshot(s));

  static Future<IsFacilityManagerRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => IsFacilityManagerRecord.fromSnapshot(s));

  static IsFacilityManagerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IsFacilityManagerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IsFacilityManagerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IsFacilityManagerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IsFacilityManagerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IsFacilityManagerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIsFacilityManagerRecordData({
  String? emailAddress,
  String? password,
  String? confirmPassword,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'EmailAddress': emailAddress,
      'password': password,
      'ConfirmPassword': confirmPassword,
    }.withoutNulls,
  );

  return firestoreData;
}

class IsFacilityManagerRecordDocumentEquality
    implements Equality<IsFacilityManagerRecord> {
  const IsFacilityManagerRecordDocumentEquality();

  @override
  bool equals(IsFacilityManagerRecord? e1, IsFacilityManagerRecord? e2) {
    return e1?.emailAddress == e2?.emailAddress &&
        e1?.password == e2?.password &&
        e1?.confirmPassword == e2?.confirmPassword;
  }

  @override
  int hash(IsFacilityManagerRecord? e) => const ListEquality()
      .hash([e?.emailAddress, e?.password, e?.confirmPassword]);

  @override
  bool isValidKey(Object? o) => o is IsFacilityManagerRecord;
}
