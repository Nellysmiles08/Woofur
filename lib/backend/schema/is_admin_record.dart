import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IsAdminRecord extends FirestoreRecord {
  IsAdminRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "emailAddress" field.
  String? _emailAddress;
  String get emailAddress => _emailAddress ?? '';
  bool hasEmailAddress() => _emailAddress != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "confirmPassword" field.
  String? _confirmPassword;
  String get confirmPassword => _confirmPassword ?? '';
  bool hasConfirmPassword() => _confirmPassword != null;

  void _initializeFields() {
    _emailAddress = snapshotData['emailAddress'] as String?;
    _password = snapshotData['password'] as String?;
    _confirmPassword = snapshotData['confirmPassword'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('isAdmin');

  static Stream<IsAdminRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IsAdminRecord.fromSnapshot(s));

  static Future<IsAdminRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IsAdminRecord.fromSnapshot(s));

  static IsAdminRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IsAdminRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IsAdminRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IsAdminRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IsAdminRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IsAdminRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIsAdminRecordData({
  String? emailAddress,
  String? password,
  String? confirmPassword,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'emailAddress': emailAddress,
      'password': password,
      'confirmPassword': confirmPassword,
    }.withoutNulls,
  );

  return firestoreData;
}

class IsAdminRecordDocumentEquality implements Equality<IsAdminRecord> {
  const IsAdminRecordDocumentEquality();

  @override
  bool equals(IsAdminRecord? e1, IsAdminRecord? e2) {
    return e1?.emailAddress == e2?.emailAddress &&
        e1?.password == e2?.password &&
        e1?.confirmPassword == e2?.confirmPassword;
  }

  @override
  int hash(IsAdminRecord? e) => const ListEquality()
      .hash([e?.emailAddress, e?.password, e?.confirmPassword]);

  @override
  bool isValidKey(Object? o) => o is IsAdminRecord;
}
