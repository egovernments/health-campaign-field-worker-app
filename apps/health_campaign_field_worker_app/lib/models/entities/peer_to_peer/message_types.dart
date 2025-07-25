import 'package:dart_mappable/dart_mappable.dart';

part 'message_types.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum MessageTypes {
  @MappableValue("confirmation")
  confirmation,
  @MappableValue("chunk")
  chunk,
  @MappableValue("handshake")
  handShake
}

@MappableEnum(caseStyle: CaseStyle.camelCase)
enum ConfirmationTypes {
  @MappableValue("finalTransfer")
  finalTransfer,
  @MappableValue("chunk")
  chunk,
  @MappableValue("failed")
  failed,
  @MappableValue("finalAcknowledgment")
  finalAcknowledgment,
  @MappableValue("handshake")
  handShake
}

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum MessageStatus {
  @MappableValue("success")
  success,
  @MappableValue("fail")
  fail,
  @MappableValue("received")
  received,
  @MappableValue("completed")
  completed,
}
