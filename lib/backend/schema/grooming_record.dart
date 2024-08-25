import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroomingRecord extends FirestoreRecord {
  GroomingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "availibility" field.
  List<AvailibilityStruct>? _availibility;
  List<AvailibilityStruct> get availibility => _availibility ?? const [];
  bool hasAvailibility() => _availibility != null;

  // "businessHours" field.
  String? _businessHours;
  String get businessHours => _businessHours ?? '';
  bool hasBusinessHours() => _businessHours != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "neighborhood" field.
  String? _neighborhood;
  String get neighborhood => _neighborhood ?? '';
  bool hasNeighborhood() => _neighborhood != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "zipCode" field.
  int? _zipCode;
  int get zipCode => _zipCode ?? 0;
  bool hasZipCode() => _zipCode != null;

  // "daycarePhoneNumber" field.
  String? _daycarePhoneNumber;
  String get daycarePhoneNumber => _daycarePhoneNumber ?? '';
  bool hasDaycarePhoneNumber() => _daycarePhoneNumber != null;

  // "daycareEmail" field.
  String? _daycareEmail;
  String get daycareEmail => _daycareEmail ?? '';
  bool hasDaycareEmail() => _daycareEmail != null;

  // "daycareInsta" field.
  String? _daycareInsta;
  String get daycareInsta => _daycareInsta ?? '';
  bool hasDaycareInsta() => _daycareInsta != null;

  // "rules" field.
  String? _rules;
  String get rules => _rules ?? '';
  bool hasRules() => _rules != null;

  // "facilityManagerPicture" field.
  String? _facilityManagerPicture;
  String get facilityManagerPicture => _facilityManagerPicture ?? '';
  bool hasFacilityManagerPicture() => _facilityManagerPicture != null;

  // "facilityManagerName" field.
  String? _facilityManagerName;
  String get facilityManagerName => _facilityManagerName ?? '';
  bool hasFacilityManagerName() => _facilityManagerName != null;

  // "facilityManagerDescriptioni" field.
  String? _facilityManagerDescriptioni;
  String get facilityManagerDescriptioni => _facilityManagerDescriptioni ?? '';
  bool hasFacilityManagerDescriptioni() => _facilityManagerDescriptioni != null;

  // "reservedSlot" field.
  List<DateTime>? _reservedSlot;
  List<DateTime> get reservedSlot => _reservedSlot ?? const [];
  bool hasReservedSlot() => _reservedSlot != null;

  // "connectedAccountId" field.
  String? _connectedAccountId;
  String get connectedAccountId => _connectedAccountId ?? '';
  bool hasConnectedAccountId() => _connectedAccountId != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _img = snapshotData['img'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _price = castToType<int>(snapshotData['price']);
    _availibility = getStructList(
      snapshotData['availibility'],
      AvailibilityStruct.fromMap,
    );
    _businessHours = snapshotData['businessHours'] as String?;
    _country = snapshotData['country'] as String?;
    _state = snapshotData['state'] as String?;
    _city = snapshotData['city'] as String?;
    _neighborhood = snapshotData['neighborhood'] as String?;
    _address = snapshotData['address'] as String?;
    _zipCode = castToType<int>(snapshotData['zipCode']);
    _daycarePhoneNumber = snapshotData['daycarePhoneNumber'] as String?;
    _daycareEmail = snapshotData['daycareEmail'] as String?;
    _daycareInsta = snapshotData['daycareInsta'] as String?;
    _rules = snapshotData['rules'] as String?;
    _facilityManagerPicture = snapshotData['facilityManagerPicture'] as String?;
    _facilityManagerName = snapshotData['facilityManagerName'] as String?;
    _facilityManagerDescriptioni =
        snapshotData['facilityManagerDescriptioni'] as String?;
    _reservedSlot = getDataList(snapshotData['reservedSlot']);
    _connectedAccountId = snapshotData['connectedAccountId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Grooming');

  static Stream<GroomingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroomingRecord.fromSnapshot(s));

  static Future<GroomingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroomingRecord.fromSnapshot(s));

  static GroomingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GroomingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroomingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroomingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroomingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroomingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroomingRecordData({
  String? name,
  String? img,
  DocumentReference? userRef,
  int? price,
  String? businessHours,
  String? country,
  String? state,
  String? city,
  String? neighborhood,
  String? address,
  int? zipCode,
  String? daycarePhoneNumber,
  String? daycareEmail,
  String? daycareInsta,
  String? rules,
  String? facilityManagerPicture,
  String? facilityManagerName,
  String? facilityManagerDescriptioni,
  String? connectedAccountId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'img': img,
      'userRef': userRef,
      'price': price,
      'businessHours': businessHours,
      'country': country,
      'state': state,
      'city': city,
      'neighborhood': neighborhood,
      'address': address,
      'zipCode': zipCode,
      'daycarePhoneNumber': daycarePhoneNumber,
      'daycareEmail': daycareEmail,
      'daycareInsta': daycareInsta,
      'rules': rules,
      'facilityManagerPicture': facilityManagerPicture,
      'facilityManagerName': facilityManagerName,
      'facilityManagerDescriptioni': facilityManagerDescriptioni,
      'connectedAccountId': connectedAccountId,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroomingRecordDocumentEquality implements Equality<GroomingRecord> {
  const GroomingRecordDocumentEquality();

  @override
  bool equals(GroomingRecord? e1, GroomingRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.img == e2?.img &&
        e1?.userRef == e2?.userRef &&
        e1?.price == e2?.price &&
        listEquality.equals(e1?.availibility, e2?.availibility) &&
        e1?.businessHours == e2?.businessHours &&
        e1?.country == e2?.country &&
        e1?.state == e2?.state &&
        e1?.city == e2?.city &&
        e1?.neighborhood == e2?.neighborhood &&
        e1?.address == e2?.address &&
        e1?.zipCode == e2?.zipCode &&
        e1?.daycarePhoneNumber == e2?.daycarePhoneNumber &&
        e1?.daycareEmail == e2?.daycareEmail &&
        e1?.daycareInsta == e2?.daycareInsta &&
        e1?.rules == e2?.rules &&
        e1?.facilityManagerPicture == e2?.facilityManagerPicture &&
        e1?.facilityManagerName == e2?.facilityManagerName &&
        e1?.facilityManagerDescriptioni == e2?.facilityManagerDescriptioni &&
        listEquality.equals(e1?.reservedSlot, e2?.reservedSlot) &&
        e1?.connectedAccountId == e2?.connectedAccountId;
  }

  @override
  int hash(GroomingRecord? e) => const ListEquality().hash([
        e?.name,
        e?.img,
        e?.userRef,
        e?.price,
        e?.availibility,
        e?.businessHours,
        e?.country,
        e?.state,
        e?.city,
        e?.neighborhood,
        e?.address,
        e?.zipCode,
        e?.daycarePhoneNumber,
        e?.daycareEmail,
        e?.daycareInsta,
        e?.rules,
        e?.facilityManagerPicture,
        e?.facilityManagerName,
        e?.facilityManagerDescriptioni,
        e?.reservedSlot,
        e?.connectedAccountId
      ]);

  @override
  bool isValidKey(Object? o) => o is GroomingRecord;
}
