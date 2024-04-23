// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'] as String?,
      primaryImage: json['primaryImage'] == null
          ? null
          : PrimaryImageModel.fromJson(
              json['primaryImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'primaryImage': instance.primaryImage,
    };
