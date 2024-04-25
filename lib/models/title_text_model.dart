import 'package:json_annotation/json_annotation.dart';

part 'title_text_model.g.dart';

@JsonSerializable()
class TitleTextModel {
  TitleTextModel({ this.text});
  final String? text;
  factory TitleTextModel.fromJson(Map<String, dynamic> json) =>
      _$TitleTextModelFromJson(json);

  Map<String, dynamic> toJson() => _$TitleTextModelToJson(this);
}