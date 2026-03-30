import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/home/domain/model/subject_model.dart';
part 'subject_dto.g.dart';

@JsonSerializable()
class SubjectDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  SubjectDto({this.id, this.name, this.icon, this.createdAt});

  SubjectModel toDomain() => SubjectModel(
    id: id ??"",
    name: name??"",
    icon: icon??"",
  );

  factory SubjectDto.fromJson(Map<String, dynamic> json) =>
      _$SubjectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectDtoToJson(this);
}