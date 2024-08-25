import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WooFurRecord extends FirestoreRecord {
  WooFurRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "wooFurLogo" field.
  String? _wooFurLogo;
  String get wooFurLogo => _wooFurLogo ?? '';
  bool hasWooFurLogo() => _wooFurLogo != null;

  // "promoCodes" field.
  List<String>? _promoCodes;
  List<String> get promoCodes => _promoCodes ?? const [];
  bool hasPromoCodes() => _promoCodes != null;

  void _initializeFields() {
    _wooFurLogo = snapshotData['wooFurLogo'] as String?;
    _promoCodes = getDataList(snapshotData['promoCodes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('WooFur');

  static Stream<WooFurRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WooFurRecord.fromSnapshot(s));

  static Future<WooFurRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WooFurRecord.fromSnapshot(s));

  static WooFurRecord fromSnapshot(DocumentSnapshot snapshot) => WooFurRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WooFurRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WooFurRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WooFurRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WooFurRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWooFurRecordData({
  String? wooFurLogo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'wooFurLogo': wooFurLogo,
    }.withoutNulls,
  );

  return firestoreData;
}

class WooFurRecordDocumentEquality implements Equality<WooFurRecord> {
  const WooFurRecordDocumentEquality();

  @override
  bool equals(WooFurRecord? e1, WooFurRecord? e2) {
    const listEquality = ListEquality();
    return e1?.wooFurLogo == e2?.wooFurLogo &&
        listEquality.equals(e1?.promoCodes, e2?.promoCodes);
  }

  @override
  int hash(WooFurRecord? e) =>
      const ListEquality().hash([e?.wooFurLogo, e?.promoCodes]);

  @override
  bool isValidKey(Object? o) => o is WooFurRecord;
}
