
import 'package:json_annotation/json_annotation.dart';
import 'package:movies/models/primary_image_model.dart';
part "movie_model.g.dart";

@JsonSerializable()
class MovieModel {
  MovieModel({this.id, this.primaryImage});
  final String? id;
  final PrimaryImageModel? primaryImage;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}

