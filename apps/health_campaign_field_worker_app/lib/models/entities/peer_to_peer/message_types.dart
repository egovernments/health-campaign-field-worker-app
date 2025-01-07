import 'package:dart_mappable/dart_mappable.dart';

part 'message_types.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum MessageTypes {
  @MappableValue("confirmation")
  confirmation,
  @MappableValue("chunk")
  chunk
}

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum ConfirmationTypes {
  @MappableValue("finalTransfer")
  finalTransfer,
  @MappableValue("chunk")
  chunk,
  @MappableValue("failed")
  failed,
  @MappableValue("finalAcknowledgment")
  finalAcknowledgment,
}

@MappableEnum(caseStyle: CaseStyle.upperCase)
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
