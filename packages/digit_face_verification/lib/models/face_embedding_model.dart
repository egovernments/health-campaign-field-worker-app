import 'package:isar/isar.dart';

part 'face_embedding_model.g.dart';

@collection
class FaceEmbedding {
  Id id = Isar.autoIncrement;

  /// Links to the field worker's individual ID.
  @Index(unique: true, replace: true)
  late String individualId;

  /// 192-dimensional face embedding vector from MobileFaceNet.
  late List<double> embedding;

  /// Timestamp when the embedding was created.
  late DateTime createdAt;

  /// Model version identifier for future model upgrades.
  late String modelVersion;

  FaceEmbedding({
    required this.individualId,
    required this.embedding,
    required this.createdAt,
    this.modelVersion = 'mobilefacenet_african_v2',
  });
}
