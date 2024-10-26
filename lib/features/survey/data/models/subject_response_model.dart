import 'package:json_annotation/json_annotation.dart';

part 'subject_response_model.g.dart';

@JsonSerializable()
class SubjectResponseModel {
  String? message;
  SubjectMetadata? metadata;
  List<SubjectModel?>? subjects;

  SubjectResponseModel(this.message, this.metadata, this.subjects);

  factory SubjectResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectResponseModelToJson(this);
}

@JsonSerializable()
class SubjectMetadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  SubjectMetadata(
      this.currentPage, this.numberOfPages, this.limit);

  factory SubjectMetadata.fromJson(Map<String, dynamic> json) =>
      _$SubjectMetadataFromJson(json);

}

@JsonSerializable()
class SubjectModel {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? icon;
  String? createdAt;

  SubjectModel(this.id, this.name, this.icon, this.createdAt);

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);

}
