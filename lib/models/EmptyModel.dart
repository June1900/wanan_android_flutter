import 'package:json_annotation/json_annotation.dart';

import 'RootModel.dart';

part 'EmptyModel.g.dart';

@JsonSerializable()
class EmptyModel extends RootModel<dynamic> {
  EmptyModel(dynamic data, int errorCode, String errorMsg)
      : super(data, errorCode, errorMsg);

  factory EmptyModel.fromJson(Map<String, dynamic> json) =>
      _$EmptyModelFromJson(json);

  toJson() => _$EmptyModelToJson(this);
}
