import 'package:freezed_annotation/freezed_annotation.dart';

part 'mock_model.freezed.dart';
part 'mock_model.g.dart';

@freezed
class MockDataModel with _$MockDataModel {
  const factory MockDataModel({required String id}) = _MockDataModel;

  factory MockDataModel.fromJson(Map<String, dynamic> json) =>
      _$MockDataModelFromJson(json);
}
