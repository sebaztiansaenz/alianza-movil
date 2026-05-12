import 'package:collection/collection.dart';

enum MoneySources {
  Salario,
  Pension,
  Otros,
}

enum Status {
  APPROVED,
  PENDING,
  REJECTED,
  FAILED,
}

enum TransactionTypes {
  Depositado,
  Withdrawal,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (MoneySources):
      return MoneySources.values.deserialize(value) as T?;
    case (Status):
      return Status.values.deserialize(value) as T?;
    case (TransactionTypes):
      return TransactionTypes.values.deserialize(value) as T?;
    default:
      return null;
  }
}
