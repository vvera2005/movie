import 'package:json_annotation/json_annotation.dart';

part 'release_year_model.g.dart';

@JsonSerializable()
class ReleaseYearModel {
  ReleaseYearModel({this.year});
  final int? year;
  
  factory ReleaseYearModel.fromJson(Map<String, dynamic> json) =>
      _$ReleaseYearModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReleaseYearModelToJson(this);
}