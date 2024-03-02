import 'package:uuid/data.dart';
import 'package:uuid/rng.dart';
import 'package:uuid/uuid.dart';

///{@template uuid_helper}
/// A helper class for generating UUIDs.
/// {@endtemplate}
abstract class UUID {
  const UUID._();

  static const Uuid _uuid = Uuid();

  static final Uuid _secureUuid = Uuid(goptions: GlobalOptions(CryptoRNG()));

  /// Generates a v4 UUID.
  static String v4({String separator = '-'}) => _uuid.v4().replaceAll('-', separator);

  /// Generates a secure v4 UUID.
  static String secureV4({
    String separator = '-',
  }) =>
      _secureUuid.v4().replaceAll('-', separator);

  /// Generates a v5 UUID.
  static String v5(
    String? namespace,
    String? name, {
    String separator = '-',
  }) =>
      _uuid.v5(namespace, name).replaceAll('-', separator);

  /// Generates a secure v5 UUID.
  static String secureV5(
    String? namespace,
    String? name, {
    String separator = '-',
  }) =>
      _secureUuid.v5(namespace, name).replaceAll('-', separator);

  /// Generates a v7 UUID.
  static String v7({String separator = '-'}) => _uuid.v7().replaceAll('-', separator);

  /// Generates a secure v7 UUID.
  static String secureV7({String separator = '-'}) => _secureUuid.v7().replaceAll('-', separator);

  /// Checks if a given string is a valid UUID.
  static bool isValid(String uuid) => Uuid.isValidUUID(fromString: uuid);
}
