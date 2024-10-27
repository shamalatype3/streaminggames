import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchesRecord extends FirestoreRecord {
  MatchesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Date_time" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "equipment_1" field.
  String? _equipment1;
  String get equipment1 => _equipment1 ?? '';
  bool hasEquipment1() => _equipment1 != null;

  // "sets_E1" field.
  String? _setsE1;
  String get setsE1 => _setsE1 ?? '';
  bool hasSetsE1() => _setsE1 != null;

  // "points_E1" field.
  String? _pointsE1;
  String get pointsE1 => _pointsE1 ?? '';
  bool hasPointsE1() => _pointsE1 != null;

  // "equipment_2" field.
  String? _equipment2;
  String get equipment2 => _equipment2 ?? '';
  bool hasEquipment2() => _equipment2 != null;

  // "sets_E2" field.
  String? _setsE2;
  String get setsE2 => _setsE2 ?? '';
  bool hasSetsE2() => _setsE2 != null;

  // "points_E2" field.
  String? _pointsE2;
  String get pointsE2 => _pointsE2 ?? '';
  bool hasPointsE2() => _pointsE2 != null;

  // "competition_name" field.
  String? _competitionName;
  String get competitionName => _competitionName ?? '';
  bool hasCompetitionName() => _competitionName != null;

  // "stange_competition" field.
  String? _stangeCompetition;
  String get stangeCompetition => _stangeCompetition ?? '';
  bool hasStangeCompetition() => _stangeCompetition != null;

  // "live" field.
  bool? _live;
  bool get live => _live ?? false;
  bool hasLive() => _live != null;

  // "competition_location" field.
  String? _competitionLocation;
  String get competitionLocation => _competitionLocation ?? '';
  bool hasCompetitionLocation() => _competitionLocation != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "home" field.
  String? _home;
  String get home => _home ?? '';
  bool hasHome() => _home != null;

  // "away" field.
  String? _away;
  String get away => _away ?? '';
  bool hasAway() => _away != null;

  // "court_name" field.
  String? _courtName;
  String get courtName => _courtName ?? '';
  bool hasCourtName() => _courtName != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "type_of_Sport" field.
  String? _typeOfSport;
  String get typeOfSport => _typeOfSport ?? '';
  bool hasTypeOfSport() => _typeOfSport != null;

  // "livestreamVideoUrl" field.
  String? _livestreamVideoUrl;
  String get livestreamVideoUrl => _livestreamVideoUrl ?? '';
  bool hasLivestreamVideoUrl() => _livestreamVideoUrl != null;

  void _initializeFields() {
    _dateTime = snapshotData['Date_time'] as DateTime?;
    _equipment1 = snapshotData['equipment_1'] as String?;
    _setsE1 = snapshotData['sets_E1'] as String?;
    _pointsE1 = snapshotData['points_E1'] as String?;
    _equipment2 = snapshotData['equipment_2'] as String?;
    _setsE2 = snapshotData['sets_E2'] as String?;
    _pointsE2 = snapshotData['points_E2'] as String?;
    _competitionName = snapshotData['competition_name'] as String?;
    _stangeCompetition = snapshotData['stange_competition'] as String?;
    _live = snapshotData['live'] as bool?;
    _competitionLocation = snapshotData['competition_location'] as String?;
    _uid = snapshotData['uid'] as String?;
    _home = snapshotData['home'] as String?;
    _away = snapshotData['away'] as String?;
    _courtName = snapshotData['court_name'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _typeOfSport = snapshotData['type_of_Sport'] as String?;
    _livestreamVideoUrl = snapshotData['livestreamVideoUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MATCHES');

  static Stream<MatchesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MatchesRecord.fromSnapshot(s));

  static Future<MatchesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MatchesRecord.fromSnapshot(s));

  static MatchesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MatchesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MatchesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MatchesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MatchesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MatchesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMatchesRecordData({
  DateTime? dateTime,
  String? equipment1,
  String? setsE1,
  String? pointsE1,
  String? equipment2,
  String? setsE2,
  String? pointsE2,
  String? competitionName,
  String? stangeCompetition,
  bool? live,
  String? competitionLocation,
  String? uid,
  String? home,
  String? away,
  String? courtName,
  DocumentReference? userRef,
  String? typeOfSport,
  String? livestreamVideoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Date_time': dateTime,
      'equipment_1': equipment1,
      'sets_E1': setsE1,
      'points_E1': pointsE1,
      'equipment_2': equipment2,
      'sets_E2': setsE2,
      'points_E2': pointsE2,
      'competition_name': competitionName,
      'stange_competition': stangeCompetition,
      'live': live,
      'competition_location': competitionLocation,
      'uid': uid,
      'home': home,
      'away': away,
      'court_name': courtName,
      'userRef': userRef,
      'type_of_Sport': typeOfSport,
      'livestreamVideoUrl': livestreamVideoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class MatchesRecordDocumentEquality implements Equality<MatchesRecord> {
  const MatchesRecordDocumentEquality();

  @override
  bool equals(MatchesRecord? e1, MatchesRecord? e2) {
    return e1?.dateTime == e2?.dateTime &&
        e1?.equipment1 == e2?.equipment1 &&
        e1?.setsE1 == e2?.setsE1 &&
        e1?.pointsE1 == e2?.pointsE1 &&
        e1?.equipment2 == e2?.equipment2 &&
        e1?.setsE2 == e2?.setsE2 &&
        e1?.pointsE2 == e2?.pointsE2 &&
        e1?.competitionName == e2?.competitionName &&
        e1?.stangeCompetition == e2?.stangeCompetition &&
        e1?.live == e2?.live &&
        e1?.competitionLocation == e2?.competitionLocation &&
        e1?.uid == e2?.uid &&
        e1?.home == e2?.home &&
        e1?.away == e2?.away &&
        e1?.courtName == e2?.courtName &&
        e1?.userRef == e2?.userRef &&
        e1?.typeOfSport == e2?.typeOfSport &&
        e1?.livestreamVideoUrl == e2?.livestreamVideoUrl;
  }

  @override
  int hash(MatchesRecord? e) => const ListEquality().hash([
        e?.dateTime,
        e?.equipment1,
        e?.setsE1,
        e?.pointsE1,
        e?.equipment2,
        e?.setsE2,
        e?.pointsE2,
        e?.competitionName,
        e?.stangeCompetition,
        e?.live,
        e?.competitionLocation,
        e?.uid,
        e?.home,
        e?.away,
        e?.courtName,
        e?.userRef,
        e?.typeOfSport,
        e?.livestreamVideoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is MatchesRecord;
}
