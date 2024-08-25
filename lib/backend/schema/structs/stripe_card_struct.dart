// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class StripeCardStruct extends FFFirebaseStruct {
  StripeCardStruct({
    String? brand,
    String? country,
    int? expMonth,
    int? expYear,
    String? funding,
    String? type,
    String? last4,
    String? name,
    String? city,
    String? state,
    String? zipCode,
    String? address,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _brand = brand,
        _country = country,
        _expMonth = expMonth,
        _expYear = expYear,
        _funding = funding,
        _type = type,
        _last4 = last4,
        _name = name,
        _city = city,
        _state = state,
        _zipCode = zipCode,
        _address = address,
        super(firestoreUtilData);

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  set brand(String? val) => _brand = val;

  bool hasBrand() => _brand != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "expMonth" field.
  int? _expMonth;
  int get expMonth => _expMonth ?? 0;
  set expMonth(int? val) => _expMonth = val;

  void incrementExpMonth(int amount) => expMonth = expMonth + amount;

  bool hasExpMonth() => _expMonth != null;

  // "expYear" field.
  int? _expYear;
  int get expYear => _expYear ?? 0;
  set expYear(int? val) => _expYear = val;

  void incrementExpYear(int amount) => expYear = expYear + amount;

  bool hasExpYear() => _expYear != null;

  // "funding" field.
  String? _funding;
  String get funding => _funding ?? '';
  set funding(String? val) => _funding = val;

  bool hasFunding() => _funding != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "last4" field.
  String? _last4;
  String get last4 => _last4 ?? '';
  set last4(String? val) => _last4 = val;

  bool hasLast4() => _last4 != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "zipCode" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  set zipCode(String? val) => _zipCode = val;

  bool hasZipCode() => _zipCode != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  static StripeCardStruct fromMap(Map<String, dynamic> data) =>
      StripeCardStruct(
        brand: data['brand'] as String?,
        country: data['country'] as String?,
        expMonth: castToType<int>(data['expMonth']),
        expYear: castToType<int>(data['expYear']),
        funding: data['funding'] as String?,
        type: data['type'] as String?,
        last4: data['last4'] as String?,
        name: data['name'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        zipCode: data['zipCode'] as String?,
        address: data['address'] as String?,
      );

  static StripeCardStruct? maybeFromMap(dynamic data) => data is Map
      ? StripeCardStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'brand': _brand,
        'country': _country,
        'expMonth': _expMonth,
        'expYear': _expYear,
        'funding': _funding,
        'type': _type,
        'last4': _last4,
        'name': _name,
        'city': _city,
        'state': _state,
        'zipCode': _zipCode,
        'address': _address,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'brand': serializeParam(
          _brand,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'expMonth': serializeParam(
          _expMonth,
          ParamType.int,
        ),
        'expYear': serializeParam(
          _expYear,
          ParamType.int,
        ),
        'funding': serializeParam(
          _funding,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'last4': serializeParam(
          _last4,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'zipCode': serializeParam(
          _zipCode,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
      }.withoutNulls;

  static StripeCardStruct fromSerializableMap(Map<String, dynamic> data) =>
      StripeCardStruct(
        brand: deserializeParam(
          data['brand'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        expMonth: deserializeParam(
          data['expMonth'],
          ParamType.int,
          false,
        ),
        expYear: deserializeParam(
          data['expYear'],
          ParamType.int,
          false,
        ),
        funding: deserializeParam(
          data['funding'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        last4: deserializeParam(
          data['last4'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        zipCode: deserializeParam(
          data['zipCode'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StripeCardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StripeCardStruct &&
        brand == other.brand &&
        country == other.country &&
        expMonth == other.expMonth &&
        expYear == other.expYear &&
        funding == other.funding &&
        type == other.type &&
        last4 == other.last4 &&
        name == other.name &&
        city == other.city &&
        state == other.state &&
        zipCode == other.zipCode &&
        address == other.address;
  }

  @override
  int get hashCode => const ListEquality().hash([
        brand,
        country,
        expMonth,
        expYear,
        funding,
        type,
        last4,
        name,
        city,
        state,
        zipCode,
        address
      ]);
}

StripeCardStruct createStripeCardStruct({
  String? brand,
  String? country,
  int? expMonth,
  int? expYear,
  String? funding,
  String? type,
  String? last4,
  String? name,
  String? city,
  String? state,
  String? zipCode,
  String? address,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StripeCardStruct(
      brand: brand,
      country: country,
      expMonth: expMonth,
      expYear: expYear,
      funding: funding,
      type: type,
      last4: last4,
      name: name,
      city: city,
      state: state,
      zipCode: zipCode,
      address: address,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StripeCardStruct? updateStripeCardStruct(
  StripeCardStruct? stripeCard, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stripeCard
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStripeCardStructData(
  Map<String, dynamic> firestoreData,
  StripeCardStruct? stripeCard,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stripeCard == null) {
    return;
  }
  if (stripeCard.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stripeCard.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stripeCardData = getStripeCardFirestoreData(stripeCard, forFieldValue);
  final nestedData = stripeCardData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stripeCard.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStripeCardFirestoreData(
  StripeCardStruct? stripeCard, [
  bool forFieldValue = false,
]) {
  if (stripeCard == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stripeCard.toMap());

  // Add any Firestore field values
  stripeCard.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStripeCardListFirestoreData(
  List<StripeCardStruct>? stripeCards,
) =>
    stripeCards?.map((e) => getStripeCardFirestoreData(e, true)).toList() ?? [];
