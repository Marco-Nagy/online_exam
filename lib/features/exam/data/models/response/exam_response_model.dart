import 'package:json_annotation/json_annotation.dart';

part 'exam_response_model.g.dart';

@JsonSerializable()
class ExamResponseModel {
  final String? message;
  final ExamsMetadata? metadata;
  final List<Exams?>? exams;

  ExamResponseModel(this.message, this.metadata, this.exams);

  factory ExamResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ExamResponseModelFromJson(json);

}

@JsonSerializable()
class ExamsMetadata {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;

  ExamsMetadata(this.currentPage, this.numberOfPages, this.limit);

  factory ExamsMetadata.fromJson(Map<String, dynamic> json) =>
      _$ExamsMetadataFromJson(json);
}

@JsonSerializable()
class Exams {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final String? createdAt;

  Exams(this.id, this.title, this.duration, this.subject,
      this.numberOfQuestions, this.active, this.createdAt);

  factory Exams.fromJson(Map<String, dynamic> json) =>
      _$ExamsFromJson(json);


}
