import 'package:json_annotation/json_annotation.dart';
import 'package:movie/data/model/people/people_model.dart';

part 'credit_model.g.dart';

@JsonSerializable()
final class CreditModel {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "person")
  PeopleModel person;
  @JsonKey(name: "character")
  String character;
  @JsonKey(name: "order")
  int order;

  CreditModel({
    required this.id,
    required this.person,
    required this.character,
    required this.order,
  });

  factory CreditModel.fromJson(Map<String, dynamic> json) => _$CreditModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreditModelToJson(this);

  CreditModel fromJson(Map<String, dynamic> json) => _$CreditModelFromJson(json);
}
