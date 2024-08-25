import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramRecord extends FirestoreRecord {
  ProgramRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<int>(snapshotData['price']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Program')
          : FirebaseFirestore.instance.collectionGroup('Program');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Program').doc(id);

  static Stream<ProgramRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProgramRecord.fromSnapshot(s));

  static Future<ProgramRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProgramRecord.fromSnapshot(s));

  static ProgramRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProgramRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProgramRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProgramRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProgramRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProgramRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProgramRecordData({
  String? name,
  String? description,
  int? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProgramRecordDocumentEquality implements Equality<ProgramRecord> {
  const ProgramRecordDocumentEquality();

  @override
  bool equals(ProgramRecord? e1, ProgramRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price;
  }

  @override
  int hash(ProgramRecord? e) =>
      const ListEquality().hash([e?.name, e?.description, e?.price]);

  @override
  bool isValidKey(Object? o) => o is ProgramRecord;
}
