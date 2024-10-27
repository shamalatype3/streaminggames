import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SchoolsRecord extends FirestoreRecord {
  SchoolsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name_school" field.
  String? _nameSchool;
  String get nameSchool => _nameSchool ?? '';
  bool hasNameSchool() => _nameSchool != null;

  // "Logo_school" field.
  String? _logoSchool;
  String get logoSchool => _logoSchool ?? '';
  bool hasLogoSchool() => _logoSchool != null;

  void _initializeFields() {
    _nameSchool = snapshotData['Name_school'] as String?;
    _logoSchool = snapshotData['Logo_school'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Schools');

  static Stream<SchoolsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SchoolsRecord.fromSnapshot(s));

  static Future<SchoolsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SchoolsRecord.fromSnapshot(s));

  static SchoolsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SchoolsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SchoolsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SchoolsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SchoolsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SchoolsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSchoolsRecordData({
  String? nameSchool,
  String? logoSchool,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name_school': nameSchool,
      'Logo_school': logoSchool,
    }.withoutNulls,
  );

  return firestoreData;
}

class SchoolsRecordDocumentEquality implements Equality<SchoolsRecord> {
  const SchoolsRecordDocumentEquality();

  @override
  bool equals(SchoolsRecord? e1, SchoolsRecord? e2) {
    return e1?.nameSchool == e2?.nameSchool && e1?.logoSchool == e2?.logoSchool;
  }

  @override
  int hash(SchoolsRecord? e) =>
      const ListEquality().hash([e?.nameSchool, e?.logoSchool]);

  @override
  bool isValidKey(Object? o) => o is SchoolsRecord;
}
