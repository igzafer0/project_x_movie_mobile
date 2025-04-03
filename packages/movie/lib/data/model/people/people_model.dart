import 'package:json_annotation/json_annotation.dart';

part 'people_model.g.dart';

@JsonSerializable()
final class PeopleModel {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "profile")
  String photo;
  PeopleModel({
    required this.id,
    required this.name,
    required this.photo,
  });

  factory PeopleModel.fromJson(Map<String, dynamic> json) => _$PeopleModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleModelToJson(this);

  PeopleModel fromJson(Map<String, dynamic> json) => _$PeopleModelFromJson(json);
}
