import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReferralsRecord extends FirestoreRecord {
  ReferralsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "referredBy" field.
  String? _referredBy;
  String get referredBy => _referredBy ?? '';
  bool hasReferredBy() => _referredBy != null;

  // "referredTo" field.
  String? _referredTo;
  String get referredTo => _referredTo ?? '';
  bool hasReferredTo() => _referredTo != null;

  // "referToAmount" field.
  int? _referToAmount;
  int get referToAmount => _referToAmount ?? 0;
  bool hasReferToAmount() => _referToAmount != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _referredBy = snapshotData['referredBy'] as String?;
    _referredTo = snapshotData['referredTo'] as String?;
    _referToAmount = castToType<int>(snapshotData['referToAmount']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('referrals')
          : FirebaseFirestore.instance.collectionGroup('referrals');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('referrals').doc(id);

  static Stream<ReferralsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReferralsRecord.fromSnapshot(s));

  static Future<ReferralsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReferralsRecord.fromSnapshot(s));

  static ReferralsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReferralsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReferralsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReferralsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReferralsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReferralsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReferralsRecordData({
  String? referredBy,
  String? referredTo,
  int? referToAmount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'referredBy': referredBy,
      'referredTo': referredTo,
      'referToAmount': referToAmount,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReferralsRecordDocumentEquality implements Equality<ReferralsRecord> {
  const ReferralsRecordDocumentEquality();

  @override
  bool equals(ReferralsRecord? e1, ReferralsRecord? e2) {
    return e1?.referredBy == e2?.referredBy &&
        e1?.referredTo == e2?.referredTo &&
        e1?.referToAmount == e2?.referToAmount;
  }

  @override
  int hash(ReferralsRecord? e) => const ListEquality()
      .hash([e?.referredBy, e?.referredTo, e?.referToAmount]);

  @override
  bool isValidKey(Object? o) => o is ReferralsRecord;
}
