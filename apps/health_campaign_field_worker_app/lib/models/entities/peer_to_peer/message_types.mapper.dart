// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'message_types.dart';

class MessageTypesMapper extends EnumMapper<MessageTypes> {
  MessageTypesMapper._();

  static MessageTypesMapper? _instance;
  static MessageTypesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MessageTypesMapper._());
    }
    return _instance!;
  }

  static MessageTypes fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MessageTypes decode(dynamic value) {
    switch (value) {
      case "confirmation":
        return MessageTypes.confirmation;
      case "chunk":
        return MessageTypes.chunk;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MessageTypes self) {
    switch (self) {
      case MessageTypes.confirmation:
        return "confirmation";
      case MessageTypes.chunk:
        return "chunk";
    }
  }
}

extension MessageTypesMapperExtension on MessageTypes {
  dynamic toValue() {
    MessageTypesMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MessageTypes>(this);
  }
}

class ConfirmationTypesMapper extends EnumMapper<ConfirmationTypes> {
  ConfirmationTypesMapper._();

  static ConfirmationTypesMapper? _instance;
  static ConfirmationTypesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConfirmationTypesMapper._());
    }
    return _instance!;
  }

  static ConfirmationTypes fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ConfirmationTypes decode(dynamic value) {
    switch (value) {
      case "finalTransfer":
        return ConfirmationTypes.finalTransfer;
      case "chunk":
        return ConfirmationTypes.chunk;
      case "failed":
        return ConfirmationTypes.failed;
      case "finalAcknowledgment":
        return ConfirmationTypes.finalAcknowledgment;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ConfirmationTypes self) {
    switch (self) {
      case ConfirmationTypes.finalTransfer:
        return "finalTransfer";
      case ConfirmationTypes.chunk:
        return "chunk";
      case ConfirmationTypes.failed:
        return "failed";
      case ConfirmationTypes.finalAcknowledgment:
        return "finalAcknowledgment";
    }
  }
}

extension ConfirmationTypesMapperExtension on ConfirmationTypes {
  dynamic toValue() {
    ConfirmationTypesMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ConfirmationTypes>(this);
  }
}

class MessageStatusMapper extends EnumMapper<MessageStatus> {
  MessageStatusMapper._();

  static MessageStatusMapper? _instance;
  static MessageStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MessageStatusMapper._());
    }
    return _instance!;
  }

  static MessageStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MessageStatus decode(dynamic value) {
    switch (value) {
      case "success":
        return MessageStatus.success;
      case "fail":
        return MessageStatus.fail;
      case "received":
        return MessageStatus.received;
      case "completed":
        return MessageStatus.completed;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MessageStatus self) {
    switch (self) {
      case MessageStatus.success:
        return "success";
      case MessageStatus.fail:
        return "fail";
      case MessageStatus.received:
        return "received";
      case MessageStatus.completed:
        return "completed";
    }
  }
}

extension MessageStatusMapperExtension on MessageStatus {
  dynamic toValue() {
    MessageStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MessageStatus>(this);
  }
}
