import 'package:json_annotation/json_annotation.dart';

part 'primary_image_model.g.dart';

@JsonSerializable()
class PrimaryImageModel {
  PrimaryImageModel({this.id, this.url});
  final String? id;
  final String? url;
  factory PrimaryImageModel.fromJson(Map<String, dynamic> json) =>
      _$PrimaryImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrimaryImageModelToJson(this);
}