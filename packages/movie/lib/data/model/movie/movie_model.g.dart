// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      poster: json['poster'] as String,
      backdrop: json['backdrop'] as String,
      release: json['release'] as String,
      adult: json['adult'] as bool,
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'poster': instance.poster,
      'backdrop': instance.backdrop,
      'description': instance.description,
      'release': instance.release,
      'adult': instance.adult,
      'genres': instance.genres,
    };
