import 'package:json_annotation/json_annotation.dart';
part 'genre_model.g.dart';

@JsonSerializable()
final class GenreModel {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "poster")
  String poster;
  GenreModel({
    required this.id,
    required this.name,
    required this.poster,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);

  GenreModel fromJson(Map<String, dynamic> json) => _$GenreModelFromJson(json);
}
