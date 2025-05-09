import 'package:genre/data/model/genre/genre_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
final class MovieModel {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "poster")
  String poster;
  @JsonKey(name: "backdrop")
  String backdrop;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "release")
  DateTime release;
  @JsonKey(name: "adult")
  bool adult;
  @JsonKey(name: "genres", defaultValue: [])
  List<GenreModel> genres = [];

  MovieModel({
    required this.id,
    required this.name,
    required this.description,
    required this.poster,
    required this.backdrop,
    required this.release,
    required this.adult,
    required this.genres,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  MovieModel fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);
}
