import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservationsRecord extends FirestoreRecord {
  ReservationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "daycareRef" field.
  DocumentReference? _daycareRef;
  DocumentReference? get daycareRef => _daycareRef;
  bool hasDaycareRef() => _daycareRef != null;

  // "programRef" field.
  DocumentReference? _programRef;
  DocumentReference? get programRef => _programRef;
  bool hasProgramRef() => _programRef != null;

  // "reservationDate" field.
  DateTime? _reservationDate;
  DateTime? get reservationDate => _reservationDate;
  bool hasReservationDate() => _reservationDate != null;

  // "reservationPrice" field.
  double? _reservationPrice;
  double get reservationPrice => _reservationPrice ?? 0.0;
  bool hasReservationPrice() => _reservationPrice != null;

  // "paymentUsed" field.
  DocumentReference? _paymentUsed;
  DocumentReference? get paymentUsed => _paymentUsed;
  bool hasPaymentUsed() => _paymentUsed != null;

  // "reservationEndDate" field.
  DateTime? _reservationEndDate;
  DateTime? get reservationEndDate => _reservationEndDate;
  bool hasReservationEndDate() => _reservationEndDate != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "payment_intent_id" field.
  String? _paymentIntentId;
  String get paymentIntentId => _paymentIntentId ?? '';
  bool hasPaymentIntentId() => _paymentIntentId != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "with_balance" field.
  bool? _withBalance;
  bool get withBalance => _withBalance ?? false;
  bool hasWithBalance() => _withBalance != null;

  // "balance_amount" field.
  double? _balanceAmount;
  double get balanceAmount => _balanceAmount ?? 0.0;
  bool hasBalanceAmount() => _balanceAmount != null;

  // "pay_connected_account" field.
  double? _payConnectedAccount;
  double get payConnectedAccount => _payConnectedAccount ?? 0.0;
  bool hasPayConnectedAccount() => _payConnectedAccount != null;

  // "groomingRef" field.
  DocumentReference? _groomingRef;
  DocumentReference? get groomingRef => _groomingRef;
  bool hasGroomingRef() => _groomingRef != null;

  // "programRefg" field.
  DocumentReference? _programRefg;
  DocumentReference? get programRefg => _programRefg;
  bool hasProgramRefg() => _programRefg != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _daycareRef = snapshotData['daycareRef'] as DocumentReference?;
    _programRef = snapshotData['programRef'] as DocumentReference?;
    _reservationDate = snapshotData['reservationDate'] as DateTime?;
    _reservationPrice = castToType<double>(snapshotData['reservationPrice']);
    _paymentUsed = snapshotData['paymentUsed'] as DocumentReference?;
    _reservationEndDate = snapshotData['reservationEndDate'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _paymentIntentId = snapshotData['payment_intent_id'] as String?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _withBalance = snapshotData['with_balance'] as bool?;
    _balanceAmount = castToType<double>(snapshotData['balance_amount']);
    _payConnectedAccount =
        castToType<double>(snapshotData['pay_connected_account']);
    _groomingRef = snapshotData['groomingRef'] as DocumentReference?;
    _programRefg = snapshotData['programRefg'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('reservations')
          : FirebaseFirestore.instance.collectionGroup('reservations');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('reservations').doc(id);

  static Stream<ReservationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservationsRecord.fromSnapshot(s));

  static Future<ReservationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservationsRecord.fromSnapshot(s));

  static ReservationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservationsRecordData({
  DocumentReference? daycareRef,
  DocumentReference? programRef,
  DateTime? reservationDate,
  double? reservationPrice,
  DocumentReference? paymentUsed,
  DateTime? reservationEndDate,
  String? status,
  String? paymentIntentId,
  DateTime? createdDate,
  bool? withBalance,
  double? balanceAmount,
  double? payConnectedAccount,
  DocumentReference? groomingRef,
  DocumentReference? programRefg,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'daycareRef': daycareRef,
      'programRef': programRef,
      'reservationDate': reservationDate,
      'reservationPrice': reservationPrice,
      'paymentUsed': paymentUsed,
      'reservationEndDate': reservationEndDate,
      'status': status,
      'payment_intent_id': paymentIntentId,
      'created_date': createdDate,
      'with_balance': withBalance,
      'balance_amount': balanceAmount,
      'pay_connected_account': payConnectedAccount,
      'groomingRef': groomingRef,
      'programRefg': programRefg,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservationsRecordDocumentEquality
    implements Equality<ReservationsRecord> {
  const ReservationsRecordDocumentEquality();

  @override
  bool equals(ReservationsRecord? e1, ReservationsRecord? e2) {
    return e1?.daycareRef == e2?.daycareRef &&
        e1?.programRef == e2?.programRef &&
        e1?.reservationDate == e2?.reservationDate &&
        e1?.reservationPrice == e2?.reservationPrice &&
        e1?.paymentUsed == e2?.paymentUsed &&
        e1?.reservationEndDate == e2?.reservationEndDate &&
        e1?.status == e2?.status &&
        e1?.paymentIntentId == e2?.paymentIntentId &&
        e1?.createdDate == e2?.createdDate &&
        e1?.withBalance == e2?.withBalance &&
        e1?.balanceAmount == e2?.balanceAmount &&
        e1?.payConnectedAccount == e2?.payConnectedAccount &&
        e1?.groomingRef == e2?.groomingRef &&
        e1?.programRefg == e2?.programRefg;
  }

  @override
  int hash(ReservationsRecord? e) => const ListEquality().hash([
        e?.daycareRef,
        e?.programRef,
        e?.reservationDate,
        e?.reservationPrice,
        e?.paymentUsed,
        e?.reservationEndDate,
        e?.status,
        e?.paymentIntentId,
        e?.createdDate,
        e?.withBalance,
        e?.balanceAmount,
        e?.payConnectedAccount,
        e?.groomingRef,
        e?.programRefg
      ]);

  @override
  bool isValidKey(Object? o) => o is ReservationsRecord;
}
