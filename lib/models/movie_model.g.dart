// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      titleText: json['titleText'] == null
          ? null
          : TitleTextModel.fromJson(json['titleText'] as Map<String, dynamic>),
      id: json['id'] as String?,
      primaryImage: json['primaryImage'] == null
          ? null
          : PrimaryImageModel.fromJson(
              json['primaryImage'] as Map<String, dynamic>),
      releaseYear: json['releaseYear'] == null
          ? null
          : ReleaseYearModel.fromJson(
              json['releaseYear'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'primaryImage': instance.primaryImage,
      'titleText': instance.titleText,
      'releaseYear': instance.releaseYear,
    };
