import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
final class TokenModel {
  @JsonKey(name: "access")
  String? access;
  @JsonKey(name: "refresh")
  String? refresh;

  TokenModel({
    required this.access,
    required this.refresh,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  TokenModel fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);
}
