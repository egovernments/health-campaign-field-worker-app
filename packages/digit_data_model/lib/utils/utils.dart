// Importing necessary packages.
import 'dart:convert';
import 'dart:math';

import 'package:archive/archive.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:encrypt/encrypt.dart';
import 'package:uuid/uuid.dart';

import '../data/local_store/no_sql/schema/entity_mapper_listener.dart';

/// This function takes an iterable of boolean expressions and builds an AND expression from them.
/// If the iterable is empty, it returns a constant true expression.
/// Otherwise, it reduces the iterable to a single expression using the & operator, and checks if the result equals true.
Expression<bool> buildAnd(Iterable<Expression<bool>> iterable) {
  if (iterable.isEmpty) return const Constant(true);
  final result = iterable.reduce((value, element) => value & element);

  return result.equals(true);
}

/// This function takes an iterable of boolean expressions and builds an OR expression from them.
/// If the iterable is empty, it returns a constant true expression.
/// Otherwise, it reduces the iterable to a single expression using the | operator, and checks if the result equals true.
Expression<bool> buildOr(Iterable<Expression<bool>> iterable) {
  if (iterable.isEmpty) return const Constant(true);
  final result = iterable.reduce((value, element) => value | element);

  return result.equals(true);
}

/// `IdGen` is a singleton class that generates unique identifiers.
/// It uses the `Uuid` package to generate version 1 UUIDs.
class IdGen {
  static const IdGen _instance = IdGen._internal();

  static IdGen get instance => _instance;

  /// Shorthand for [instance]
  static IdGen get i => instance;

  final Uuid uuid;

  const IdGen._internal() : uuid = const Uuid();

  /// Generates a version 1 UUID and returns it as a string.
  String get identifier => uuid.v1();
}

/// `DigitDataModelSingleton` is a singleton class that holds environment configuration variables.
class DigitDataModelSingleton {
  static final DigitDataModelSingleton _digitDataModelSingleton =
      DigitDataModelSingleton._internal();

  factory DigitDataModelSingleton() {
    return _digitDataModelSingleton;
  }

  DigitDataModelSingleton._internal();

  int? _syncDownRetryCount;
  int? _retryTimeInterval;
  String? _tenantId, _errorDumpApiPath, _hierarchyType;
  EntityMapperListener? _entityListener;

  /// Sets the environment configuration variables.
  ///
  /// `hierarchyType` is intentionally not part of this init call. Hierarchy is
  /// per-project runtime state; it is populated by [setHierarchyType] when a
  /// project is selected (with env fallback inside that flow if the project
  /// payload omits it). No pre-project-selection code should read it.
  void setData({
    required int syncDownRetryCount,
    required int retryTimeInterval,
    required String tenantId,
    required EntityMapperListener entityMapper,
    required String errorDumpApiPath,
  }) {
    _syncDownRetryCount = syncDownRetryCount;
    _retryTimeInterval = retryTimeInterval;
    _entityListener = entityMapper;
    _tenantId = tenantId;
    _errorDumpApiPath = errorDumpApiPath;
  }

  /// Sets the active project's hierarchy type. Call from `ProjectBloc` after a
  /// project is selected (or after restoring a previously selected project on
  /// cold restart). Pass `null` on logout.
  ///
  /// The trailing `_<COUNTRY>` suffix is stripped on write so every reader
  /// receives the canonical schema-prefix form
  /// (e.g. `CONSOLEHCM_NI` → `CONSOLEHCM`). This is the single point of
  /// normalization for hierarchy values across the codebase.
  void setHierarchyType(String? hierarchyType) {
    _hierarchyType = _stripCountrySuffix(hierarchyType);
  }

  // Getters for the environment configuration variables.
  get syncDownRetryCount => _syncDownRetryCount;

  get retryTimeInterval => _retryTimeInterval;

  get tenantId => _tenantId;

  get errorDumpApiPath => _errorDumpApiPath;

  String? get hierarchyType => _hierarchyType;

  EntityMapperListener? get entityMapper => _entityListener;
}

/// Strips the trailing `_<COUNTRY>` suffix from a hierarchy-style value so
/// every consumer (boundary API, localization module keys, MDMS lookups) sees
/// the canonical schema-prefix form. `CONSOLEHCM_NI` → `CONSOLEHCM`,
/// `CONSOLEHCM` → `CONSOLEHCM`, `null`/`''` → unchanged.
String? _stripCountrySuffix(String? raw) {
  if (raw == null || raw.isEmpty) return raw;
  final idx = raw.indexOf('_');
  return idx == -1 ? raw : raw.substring(0, idx);
}

/// `PersistenceConfiguration` is an enum that represents the different types of persistence configurations.
enum PersistenceConfiguration { offlineFirst, onlineOnly }

Future<T> retryLocalCallOperation<T>(Future<T> Function() operation,
    {int maxRetries = 5,
    Duration retryDelay = const Duration(seconds: 1)}) async {
  int retryCount = 0;
  while (retryCount < maxRetries) {
    try {
      return await operation();
    } catch (e) {
      if (e is SqliteException && e.extendedResultCode == 5) {
        retryCount++;
        await Future.delayed(retryDelay); // Wait before retrying
      } else {
        rethrow; // Exit loop on unexpected errors
      }
    }
  }
  throw Exception(
      'Failed to complete the database operation after $maxRetries retries.');
}

class DataMapEncryptor {
  // Generate secure random bytes
  static List<int> _randomBytes(int length) =>
      List.generate(length, (_) => Random.secure().nextInt(256));

  /// Encrypts a Map and returns a base64 string
  String encryptWithRandomKey(dynamic data) {
    final keyBytes = _randomBytes(32);
    final ivBytes = _randomBytes(16);

    final key = Key(Uint8List.fromList(keyBytes));
    final iv = IV(Uint8List.fromList(ivBytes));
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    // Compress the JSON string
    final jsonData = utf8.encode(jsonEncode(data));

    final compressed = GZipEncoder().encode(jsonData);

    // Encrypt the compressed data
    final encrypted = encrypter.encryptBytes(compressed!, iv: iv);

    // Build payload (key, iv, encrypted data)
    final payload = jsonEncode({
      'key': base64UrlEncode(keyBytes),
      'iv': base64UrlEncode(ivBytes),
      'data': encrypted.base64,
    });

    return base64UrlEncode(utf8.encode(payload));
  }

  /// Decrypts the base64 QR string and returns the original Map
  static Map<String, dynamic> decrypt(String encryptedData) {
    final decodedJson = utf8.decode(base64Url.decode(encryptedData));
    final payload = jsonDecode(decodedJson);

    final key = Key(base64Url.decode(payload['key']));
    final iv = IV(base64Url.decode(payload['iv']));
    final cipherTextBase64 = payload['data'];

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    // Manually decode base64 ciphertext
    final encryptedBytes = base64.decode(cipherTextBase64);

    // Decrypt the encrypted bytes
    final decryptedBytes =
        encrypter.decryptBytes(Encrypted(encryptedBytes), iv: iv);

    // Decompress the decrypted bytes
    final decompressedBytes = GZipDecoder().decodeBytes(decryptedBytes);

    // Decode UTF-8 and parse JSON
    return jsonDecode(utf8.decode(decompressedBytes));
  }
}
