import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VersionRecord extends FirestoreRecord {
  VersionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "currentVersion" field.
  int? _currentVersion;
  int get currentVersion => _currentVersion ?? 0;
  bool hasCurrentVersion() => _currentVersion != null;

  // "versionCurrent" field.
  String? _versionCurrent;
  String get versionCurrent => _versionCurrent ?? '';
  bool hasVersionCurrent() => _versionCurrent != null;

  // "versionAndroid" field.
  String? _versionAndroid;
  String get versionAndroid => _versionAndroid ?? '';
  bool hasVersionAndroid() => _versionAndroid != null;

  // "veriontesfligth" field.
  bool? _veriontesfligth;
  bool get veriontesfligth => _veriontesfligth ?? false;
  bool hasVeriontesfligth() => _veriontesfligth != null;

  void _initializeFields() {
    _currentVersion = castToType<int>(snapshotData['currentVersion']);
    _versionCurrent = snapshotData['versionCurrent'] as String?;
    _versionAndroid = snapshotData['versionAndroid'] as String?;
    _veriontesfligth = snapshotData['veriontesfligth'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('version');

  static Stream<VersionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VersionRecord.fromSnapshot(s));

  static Future<VersionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VersionRecord.fromSnapshot(s));

  static VersionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VersionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VersionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VersionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VersionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VersionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVersionRecordData({
  int? currentVersion,
  String? versionCurrent,
  String? versionAndroid,
  bool? veriontesfligth,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'currentVersion': currentVersion,
      'versionCurrent': versionCurrent,
      'versionAndroid': versionAndroid,
      'veriontesfligth': veriontesfligth,
    }.withoutNulls,
  );

  return firestoreData;
}

class VersionRecordDocumentEquality implements Equality<VersionRecord> {
  const VersionRecordDocumentEquality();

  @override
  bool equals(VersionRecord? e1, VersionRecord? e2) {
    return e1?.currentVersion == e2?.currentVersion &&
        e1?.versionCurrent == e2?.versionCurrent &&
        e1?.versionAndroid == e2?.versionAndroid &&
        e1?.veriontesfligth == e2?.veriontesfligth;
  }

  @override
  int hash(VersionRecord? e) => const ListEquality().hash([
        e?.currentVersion,
        e?.versionCurrent,
        e?.versionAndroid,
        e?.veriontesfligth
      ]);

  @override
  bool isValidKey(Object? o) => o is VersionRecord;
}
