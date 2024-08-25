import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PetsRecord extends FirestoreRecord {
  PetsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "petProfilePicture" field.
  String? _petProfilePicture;
  String get petProfilePicture => _petProfilePicture ?? '';
  bool hasPetProfilePicture() => _petProfilePicture != null;

  // "petName" field.
  String? _petName;
  String get petName => _petName ?? '';
  bool hasPetName() => _petName != null;

  // "breed" field.
  String? _breed;
  String get breed => _breed ?? '';
  bool hasBreed() => _breed != null;

  // "weight" field.
  String? _weight;
  String get weight => _weight ?? '';
  bool hasWeight() => _weight != null;

  // "sex" field.
  String? _sex;
  String get sex => _sex ?? '';
  bool hasSex() => _sex != null;

  // "age" field.
  double? _age;
  double get age => _age ?? 0.0;
  bool hasAge() => _age != null;

  // "fixedStatus" field.
  String? _fixedStatus;
  String get fixedStatus => _fixedStatus ?? '';
  bool hasFixedStatus() => _fixedStatus != null;

  // "petInstagram" field.
  String? _petInstagram;
  String get petInstagram => _petInstagram ?? '';
  bool hasPetInstagram() => _petInstagram != null;

  // "behaviorDogs" field.
  String? _behaviorDogs;
  String get behaviorDogs => _behaviorDogs ?? '';
  bool hasBehaviorDogs() => _behaviorDogs != null;

  // "behaviorPeople" field.
  String? _behaviorPeople;
  String get behaviorPeople => _behaviorPeople ?? '';
  bool hasBehaviorPeople() => _behaviorPeople != null;

  // "aboutPet" field.
  String? _aboutPet;
  String get aboutPet => _aboutPet ?? '';
  bool hasAboutPet() => _aboutPet != null;

  // "rabies" field.
  String? _rabies;
  String get rabies => _rabies ?? '';
  bool hasRabies() => _rabies != null;

  // "DHLPP" field.
  String? _dhlpp;
  String get dhlpp => _dhlpp ?? '';
  bool hasDhlpp() => _dhlpp != null;

  // "feedingSchedule" field.
  String? _feedingSchedule;
  String get feedingSchedule => _feedingSchedule ?? '';
  bool hasFeedingSchedule() => _feedingSchedule != null;

  // "medication" field.
  String? _medication;
  String get medication => _medication ?? '';
  bool hasMedication() => _medication != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _petProfilePicture = snapshotData['petProfilePicture'] as String?;
    _petName = snapshotData['petName'] as String?;
    _breed = snapshotData['breed'] as String?;
    _weight = snapshotData['weight'] as String?;
    _sex = snapshotData['sex'] as String?;
    _age = castToType<double>(snapshotData['age']);
    _fixedStatus = snapshotData['fixedStatus'] as String?;
    _petInstagram = snapshotData['petInstagram'] as String?;
    _behaviorDogs = snapshotData['behaviorDogs'] as String?;
    _behaviorPeople = snapshotData['behaviorPeople'] as String?;
    _aboutPet = snapshotData['aboutPet'] as String?;
    _rabies = snapshotData['rabies'] as String?;
    _dhlpp = snapshotData['DHLPP'] as String?;
    _feedingSchedule = snapshotData['feedingSchedule'] as String?;
    _medication = snapshotData['medication'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('pets')
          : FirebaseFirestore.instance.collectionGroup('pets');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('pets').doc(id);

  static Stream<PetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PetsRecord.fromSnapshot(s));

  static Future<PetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PetsRecord.fromSnapshot(s));

  static PetsRecord fromSnapshot(DocumentSnapshot snapshot) => PetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPetsRecordData({
  String? petProfilePicture,
  String? petName,
  String? breed,
  String? weight,
  String? sex,
  double? age,
  String? fixedStatus,
  String? petInstagram,
  String? behaviorDogs,
  String? behaviorPeople,
  String? aboutPet,
  String? rabies,
  String? dhlpp,
  String? feedingSchedule,
  String? medication,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'petProfilePicture': petProfilePicture,
      'petName': petName,
      'breed': breed,
      'weight': weight,
      'sex': sex,
      'age': age,
      'fixedStatus': fixedStatus,
      'petInstagram': petInstagram,
      'behaviorDogs': behaviorDogs,
      'behaviorPeople': behaviorPeople,
      'aboutPet': aboutPet,
      'rabies': rabies,
      'DHLPP': dhlpp,
      'feedingSchedule': feedingSchedule,
      'medication': medication,
    }.withoutNulls,
  );

  return firestoreData;
}

class PetsRecordDocumentEquality implements Equality<PetsRecord> {
  const PetsRecordDocumentEquality();

  @override
  bool equals(PetsRecord? e1, PetsRecord? e2) {
    return e1?.petProfilePicture == e2?.petProfilePicture &&
        e1?.petName == e2?.petName &&
        e1?.breed == e2?.breed &&
        e1?.weight == e2?.weight &&
        e1?.sex == e2?.sex &&
        e1?.age == e2?.age &&
        e1?.fixedStatus == e2?.fixedStatus &&
        e1?.petInstagram == e2?.petInstagram &&
        e1?.behaviorDogs == e2?.behaviorDogs &&
        e1?.behaviorPeople == e2?.behaviorPeople &&
        e1?.aboutPet == e2?.aboutPet &&
        e1?.rabies == e2?.rabies &&
        e1?.dhlpp == e2?.dhlpp &&
        e1?.feedingSchedule == e2?.feedingSchedule &&
        e1?.medication == e2?.medication;
  }

  @override
  int hash(PetsRecord? e) => const ListEquality().hash([
        e?.petProfilePicture,
        e?.petName,
        e?.breed,
        e?.weight,
        e?.sex,
        e?.age,
        e?.fixedStatus,
        e?.petInstagram,
        e?.behaviorDogs,
        e?.behaviorPeople,
        e?.aboutPet,
        e?.rabies,
        e?.dhlpp,
        e?.feedingSchedule,
        e?.medication
      ]);

  @override
  bool isValidKey(Object? o) => o is PetsRecord;
}
