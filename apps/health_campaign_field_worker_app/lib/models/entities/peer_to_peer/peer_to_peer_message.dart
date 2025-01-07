import 'package:dart_mappable/dart_mappable.dart';

part 'peer_to_peer_message.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class PeerToPeerMessageModel with PeerToPeerMessageModelMappable {
  final String messageType;
  final String? confirmationType;
  final String? status;
  final String message;
  final String? selectedBoundaryCode;
  final int? offset;
  final int? totalCount;
  final double? progress;

  PeerToPeerMessageModel(
      {required this.messageType,
      this.confirmationType,
      this.status,
      required this.message,
      this.selectedBoundaryCode,
      this.offset,
      this.totalCount,
      this.progress});
}
