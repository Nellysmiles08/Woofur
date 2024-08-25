import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentsRecord extends FirestoreRecord {
  PaymentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nameOnCard" field.
  String? _nameOnCard;
  String get nameOnCard => _nameOnCard ?? '';
  bool hasNameOnCard() => _nameOnCard != null;

  // "expiration" field.
  DateTime? _expiration;
  DateTime? get expiration => _expiration;
  bool hasExpiration() => _expiration != null;

  // "CVV" field.
  int? _cvv;
  int get cvv => _cvv ?? 0;
  bool hasCvv() => _cvv != null;

  // "Country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "billingAddress" field.
  String? _billingAddress;
  String get billingAddress => _billingAddress ?? '';
  bool hasBillingAddress() => _billingAddress != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "stripeCardId" field.
  String? _stripeCardId;
  String get stripeCardId => _stripeCardId ?? '';
  bool hasStripeCardId() => _stripeCardId != null;

  // "paymentMethodId" field.
  String? _paymentMethodId;
  String get paymentMethodId => _paymentMethodId ?? '';
  bool hasPaymentMethodId() => _paymentMethodId != null;

  // "cardNumber" field.
  String? _cardNumber;
  String get cardNumber => _cardNumber ?? '';
  bool hasCardNumber() => _cardNumber != null;

  // "zipCode" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  bool hasZipCode() => _zipCode != null;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  bool hasBrand() => _brand != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nameOnCard = snapshotData['nameOnCard'] as String?;
    _expiration = snapshotData['expiration'] as DateTime?;
    _cvv = castToType<int>(snapshotData['CVV']);
    _country = snapshotData['Country'] as String?;
    _billingAddress = snapshotData['billingAddress'] as String?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _stripeCardId = snapshotData['stripeCardId'] as String?;
    _paymentMethodId = snapshotData['paymentMethodId'] as String?;
    _cardNumber = snapshotData['cardNumber'] as String?;
    _zipCode = snapshotData['zipCode'] as String?;
    _brand = snapshotData['brand'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('payments')
          : FirebaseFirestore.instance.collectionGroup('payments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('payments').doc(id);

  static Stream<PaymentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentsRecord.fromSnapshot(s));

  static Future<PaymentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentsRecord.fromSnapshot(s));

  static PaymentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentsRecordData({
  String? nameOnCard,
  DateTime? expiration,
  int? cvv,
  String? country,
  String? billingAddress,
  String? city,
  String? state,
  String? stripeCardId,
  String? paymentMethodId,
  String? cardNumber,
  String? zipCode,
  String? brand,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nameOnCard': nameOnCard,
      'expiration': expiration,
      'CVV': cvv,
      'Country': country,
      'billingAddress': billingAddress,
      'city': city,
      'state': state,
      'stripeCardId': stripeCardId,
      'paymentMethodId': paymentMethodId,
      'cardNumber': cardNumber,
      'zipCode': zipCode,
      'brand': brand,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentsRecordDocumentEquality implements Equality<PaymentsRecord> {
  const PaymentsRecordDocumentEquality();

  @override
  bool equals(PaymentsRecord? e1, PaymentsRecord? e2) {
    return e1?.nameOnCard == e2?.nameOnCard &&
        e1?.expiration == e2?.expiration &&
        e1?.cvv == e2?.cvv &&
        e1?.country == e2?.country &&
        e1?.billingAddress == e2?.billingAddress &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.stripeCardId == e2?.stripeCardId &&
        e1?.paymentMethodId == e2?.paymentMethodId &&
        e1?.cardNumber == e2?.cardNumber &&
        e1?.zipCode == e2?.zipCode &&
        e1?.brand == e2?.brand;
  }

  @override
  int hash(PaymentsRecord? e) => const ListEquality().hash([
        e?.nameOnCard,
        e?.expiration,
        e?.cvv,
        e?.country,
        e?.billingAddress,
        e?.city,
        e?.state,
        e?.stripeCardId,
        e?.paymentMethodId,
        e?.cardNumber,
        e?.zipCode,
        e?.brand
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentsRecord;
}
