import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  bool hasInstagram() => _instagram != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  bool hasSource() => _source != null;

  // "profilePic" field.
  String? _profilePic;
  String get profilePic => _profilePic ?? '';
  bool hasProfilePic() => _profilePic != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "zipCode" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  bool hasZipCode() => _zipCode != null;

  // "promoCodes" field.
  List<String>? _promoCodes;
  List<String> get promoCodes => _promoCodes ?? const [];
  bool hasPromoCodes() => _promoCodes != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "isFacilityManager" field.
  bool? _isFacilityManager;
  bool get isFacilityManager => _isFacilityManager ?? false;
  bool hasIsFacilityManager() => _isFacilityManager != null;

  // "stripeId" field.
  String? _stripeId;
  String get stripeId => _stripeId ?? '';
  bool hasStripeId() => _stripeId != null;

  // "stripePaymentId" field.
  String? _stripePaymentId;
  String get stripePaymentId => _stripePaymentId ?? '';
  bool hasStripePaymentId() => _stripePaymentId != null;

  // "set_pm_as_default" field.
  bool? _setPmAsDefault;
  bool get setPmAsDefault => _setPmAsDefault ?? false;
  bool hasSetPmAsDefault() => _setPmAsDefault != null;

  // "balance" field.
  double? _balance;
  double get balance => _balance ?? 0.0;
  bool hasBalance() => _balance != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _firstName = snapshotData['firstName'] as String?;
    _lastName = snapshotData['lastName'] as String?;
    _instagram = snapshotData['instagram'] as String?;
    _source = snapshotData['source'] as String?;
    _profilePic = snapshotData['profilePic'] as String?;
    _address = snapshotData['address'] as String?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _zipCode = snapshotData['zipCode'] as String?;
    _promoCodes = getDataList(snapshotData['promoCodes']);
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _isFacilityManager = snapshotData['isFacilityManager'] as bool?;
    _stripeId = snapshotData['stripeId'] as String?;
    _stripePaymentId = snapshotData['stripePaymentId'] as String?;
    _setPmAsDefault = snapshotData['set_pm_as_default'] as bool?;
    _balance = castToType<double>(snapshotData['balance']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? uid,
  DateTime? createdTime,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? firstName,
  String? lastName,
  String? instagram,
  String? source,
  String? profilePic,
  String? address,
  String? city,
  String? state,
  String? zipCode,
  String? displayName,
  String? photoUrl,
  String? phoneNumber,
  String? role,
  String? title,
  bool? isAdmin,
  bool? isFacilityManager,
  String? stripeId,
  String? stripePaymentId,
  bool? setPmAsDefault,
  double? balance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'uid': uid,
      'created_time': createdTime,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'firstName': firstName,
      'lastName': lastName,
      'instagram': instagram,
      'source': source,
      'profilePic': profilePic,
      'address': address,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'display_name': displayName,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'role': role,
      'title': title,
      'isAdmin': isAdmin,
      'isFacilityManager': isFacilityManager,
      'stripeId': stripeId,
      'stripePaymentId': stripePaymentId,
      'set_pm_as_default': setPmAsDefault,
      'balance': balance,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.instagram == e2?.instagram &&
        e1?.source == e2?.source &&
        e1?.profilePic == e2?.profilePic &&
        e1?.address == e2?.address &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.zipCode == e2?.zipCode &&
        listEquality.equals(e1?.promoCodes, e2?.promoCodes) &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.isFacilityManager == e2?.isFacilityManager &&
        e1?.stripeId == e2?.stripeId &&
        e1?.stripePaymentId == e2?.stripePaymentId &&
        e1?.setPmAsDefault == e2?.setPmAsDefault &&
        e1?.balance == e2?.balance;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.uid,
        e?.createdTime,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.firstName,
        e?.lastName,
        e?.instagram,
        e?.source,
        e?.profilePic,
        e?.address,
        e?.city,
        e?.state,
        e?.zipCode,
        e?.promoCodes,
        e?.displayName,
        e?.photoUrl,
        e?.phoneNumber,
        e?.role,
        e?.title,
        e?.isAdmin,
        e?.isFacilityManager,
        e?.stripeId,
        e?.stripePaymentId,
        e?.setPmAsDefault,
        e?.balance
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
