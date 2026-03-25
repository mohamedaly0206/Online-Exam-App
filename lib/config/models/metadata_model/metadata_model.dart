import 'package:json_annotation/json_annotation.dart';

part 'metadata_model.g.dart';

@JsonSerializable()
class MetadataModel {
  @JsonKey(name: 'currentPage')
  final int? currentPage;
  @JsonKey(name: 'numberOfPages')
  final int? numberOfPages;
  @JsonKey(name: 'limit')
  final int? limit;

  MetadataModel({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory MetadataModel.fromJson(Map<String, dynamic> json) => _$MetadataModelFromJson(json);
  Map<String, dynamic> toJson() => _$MetadataModelToJson(this);
}