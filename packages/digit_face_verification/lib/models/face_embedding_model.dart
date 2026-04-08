import 'package:isar/isar.dart';

part 'face_embedding_model.g.dart';

@collection
class FaceEmbedding {
  Id id = Isar.autoIncrement;

  /// Links to the field worker's individual ID.
  @Index(unique: true, replace: true)
  late String individualId;

  /// 192-dimensional face embedding vector from MobileFaceNet (averaged reference).
  late List<double> embedding;

  /// Raw embeddings from each angle capture during enrollment,
  /// stored as a flat list: [emb1_0, emb1_1, ..., emb1_191, emb2_0, ...].
  /// Each segment is 192 doubles. Use [angleCount] to split.
  @ignore
  List<List<double>> get angleEmbeddings {
    if (angleEmbeddingsFlat.isEmpty || angleCount <= 0) return [];
    final dim = angleEmbeddingsFlat.length ~/ angleCount;
    return List.generate(angleCount, (i) {
      return angleEmbeddingsFlat.sublist(i * dim, (i + 1) * dim);
    });
  }

  set angleEmbeddings(List<List<double>> value) {
    angleEmbeddingsFlat = value.expand((e) => e).toList();
  }

  /// Flat storage for angle embeddings (Isar-compatible).
  late List<double> angleEmbeddingsFlat;

  /// Number of angles captured during enrollment.
  late int angleCount;

  /// Whether this embedding belongs to the system (HCM-logged-in) user.
  late bool isSystemUser;

  /// The userId who enrolled this individual (system user's UUID).
  late String enrolledBy;

  /// Timestamp when the embedding was created.
  late DateTime createdAt;

  /// Model version identifier for future model upgrades.
  late String modelVersion;

  FaceEmbedding({
    required this.individualId,
    required this.embedding,
    required this.createdAt,
    List<List<double>>? angleEmbeddingsList,
    this.angleEmbeddingsFlat = const [],
    this.angleCount = 1,
    this.isSystemUser = true,
    this.enrolledBy = '',
    this.modelVersion = 'mobilefacenet_african_v2',
  }) {
    if (angleEmbeddingsList != null && angleEmbeddingsList.isNotEmpty) {
      angleEmbeddings = angleEmbeddingsList;
    }
  }
}
