import 'dart:math';

class DistanceMetrics {
  /// Default cosine similarity threshold for face verification.
  /// Tuned for African faces via ROC analysis on RFW African pairs.
  /// Update this value with the optimal threshold from the training notebook.
  static const double defaultThreshold = 0.55;

  /// Computes cosine similarity between two embedding vectors.
  /// Returns a value between -1.0 and 1.0, where 1.0 means identical.
  static double cosineSimilarity(List<double> a, List<double> b) {
    if (a.length != b.length) {
      throw ArgumentError(
        'Embedding dimensions must match: ${a.length} != ${b.length}',
      );
    }

    double dotProduct = 0.0;
    double normA = 0.0;
    double normB = 0.0;

    for (int i = 0; i < a.length; i++) {
      dotProduct += a[i] * b[i];
      normA += a[i] * a[i];
      normB += b[i] * b[i];
    }

    final denominator = sqrt(normA) * sqrt(normB);
    if (denominator == 0.0) return 0.0;

    return dotProduct / denominator;
  }

  /// Computes Euclidean distance between two embedding vectors.
  static double euclideanDistance(List<double> a, List<double> b) {
    if (a.length != b.length) {
      throw ArgumentError(
        'Embedding dimensions must match: ${a.length} != ${b.length}',
      );
    }

    double sum = 0.0;
    for (int i = 0; i < a.length; i++) {
      final diff = a[i] - b[i];
      sum += diff * diff;
    }

    return sqrt(sum);
  }

  /// Verifies if two embeddings belong to the same person.
  /// Returns a [VerificationResult] with similarity score and pass/fail.
  static VerificationResult verify(
    List<double> embedding1,
    List<double> embedding2, {
    double threshold = defaultThreshold,
  }) {
    final similarity = cosineSimilarity(embedding1, embedding2);
    return VerificationResult(
      similarity: similarity,
      isMatch: similarity >= threshold,
      threshold: threshold,
    );
  }
}

class VerificationResult {
  final double similarity;
  final bool isMatch;
  final double threshold;

  const VerificationResult({
    required this.similarity,
    required this.isMatch,
    required this.threshold,
  });

  @override
  String toString() =>
      'VerificationResult(similarity: ${similarity.toStringAsFixed(4)}, '
      'isMatch: $isMatch, threshold: $threshold)';
}
