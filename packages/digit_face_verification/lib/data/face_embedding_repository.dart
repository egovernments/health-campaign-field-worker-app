import 'package:isar/isar.dart';

import '../models/face_embedding_model.dart';

/// Repository for storing and retrieving face embeddings via Isar.
class FaceEmbeddingRepository {
  final Isar _isar;

  FaceEmbeddingRepository(this._isar);

  /// Saves a face embedding for the given individual.
  /// Replaces any existing embedding for the same individualId.
  Future<void> saveEmbedding({
    required String individualId,
    required List<double> embedding,
    String modelVersion = 'mobilefacenet_african_v2',
  }) async {
    final faceEmbedding = FaceEmbedding(
      individualId: individualId,
      embedding: embedding,
      createdAt: DateTime.now(),
      modelVersion: modelVersion,
    );

    await _isar.writeTxn(() async {
      await _isar.faceEmbeddings.put(faceEmbedding);
    });
  }

  /// Retrieves the stored embedding for an individual.
  /// Returns null if no embedding exists.
  Future<FaceEmbedding?> getEmbedding(String individualId) async {
    return _isar.faceEmbeddings
        .where()
        .individualIdEqualTo(individualId)
        .findFirst();
  }

  /// Checks whether a face embedding exists for the given individual.
  Future<bool> hasEmbedding(String individualId) async {
    final count = await _isar.faceEmbeddings
        .where()
        .individualIdEqualTo(individualId)
        .count();
    return count > 0;
  }

  /// Deletes the face embedding for an individual.
  Future<void> deleteEmbedding(String individualId) async {
    await _isar.writeTxn(() async {
      await _isar.faceEmbeddings
          .where()
          .individualIdEqualTo(individualId)
          .deleteAll();
    });
  }

  /// Returns the count of all stored embeddings.
  Future<int> count() async {
    return _isar.faceEmbeddings.count();
  }
}
