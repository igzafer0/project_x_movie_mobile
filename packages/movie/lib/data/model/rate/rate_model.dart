import 'package:json_annotation/json_annotation.dart';

part 'rate_model.g.dart';

@JsonSerializable()
final class RateModel {
  @JsonKey(name: "rate")
  double rate;
  RateModel({required this.rate});

  factory RateModel.fromJson(Map<String, dynamic> json) => _$RateModelFromJson(json);

  Map<String, dynamic> toJson() => _$RateModelToJson(this);

  RateModel fromJson(Map<String, dynamic> json) => _$RateModelFromJson(json);
}
