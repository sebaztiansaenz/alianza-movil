import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicesRecord extends FirestoreRecord {
  ServicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ServiceMainType" field.
  String? _serviceMainType;
  String get serviceMainType => _serviceMainType ?? '';
  bool hasServiceMainType() => _serviceMainType != null;

  // "TypesOfProductName" field.
  String? _typesOfProductName;
  String get typesOfProductName => _typesOfProductName ?? '';
  bool hasTypesOfProductName() => _typesOfProductName != null;

  // "EA" field.
  double? _ea;
  double get ea => _ea ?? 0.0;
  bool hasEa() => _ea != null;

  // "MV" field.
  double? _mv;
  double get mv => _mv ?? 0.0;
  bool hasMv() => _mv != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "ProductNumber" field.
  int? _productNumber;
  int get productNumber => _productNumber ?? 0;
  bool hasProductNumber() => _productNumber != null;

  void _initializeFields() {
    _serviceMainType = snapshotData['ServiceMainType'] as String?;
    _typesOfProductName = snapshotData['TypesOfProductName'] as String?;
    _ea = castToType<double>(snapshotData['EA']);
    _mv = castToType<double>(snapshotData['MV']);
    _user = snapshotData['user'] as DocumentReference?;
    _productNumber = castToType<int>(snapshotData['ProductNumber']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Services');

  static Stream<ServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicesRecord.fromSnapshot(s));

  static Future<ServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicesRecord.fromSnapshot(s));

  static ServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicesRecordData({
  String? serviceMainType,
  String? typesOfProductName,
  double? ea,
  double? mv,
  DocumentReference? user,
  int? productNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ServiceMainType': serviceMainType,
      'TypesOfProductName': typesOfProductName,
      'EA': ea,
      'MV': mv,
      'user': user,
      'ProductNumber': productNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServicesRecordDocumentEquality implements Equality<ServicesRecord> {
  const ServicesRecordDocumentEquality();

  @override
  bool equals(ServicesRecord? e1, ServicesRecord? e2) {
    return e1?.serviceMainType == e2?.serviceMainType &&
        e1?.typesOfProductName == e2?.typesOfProductName &&
        e1?.ea == e2?.ea &&
        e1?.mv == e2?.mv &&
        e1?.user == e2?.user &&
        e1?.productNumber == e2?.productNumber;
  }

  @override
  int hash(ServicesRecord? e) => const ListEquality().hash([
        e?.serviceMainType,
        e?.typesOfProductName,
        e?.ea,
        e?.mv,
        e?.user,
        e?.productNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is ServicesRecord;
}
