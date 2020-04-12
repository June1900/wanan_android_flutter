import 'package:json_annotation/json_annotation.dart';

import '../RootModel.dart';
import 'ProjectClassifyItemModel.dart';


part 'ProjectClassifyModel.g.dart';

@JsonSerializable()
class ProjectClassifyModel extends RootModel<List<ProjectClassifyItemModel>> {
  ProjectClassifyModel(
      List<ProjectClassifyItemModel> data, int errorCode, String errorMsg)
      : super(data, errorCode, errorMsg);

  factory ProjectClassifyModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectClassifyModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ProjectClassifyModelToJson(this);
  }
}
