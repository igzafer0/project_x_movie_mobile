// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditModel _$CreditModelFromJson(Map<String, dynamic> json) => CreditModel(
      id: (json['id'] as num).toInt(),
      person: PeopleModel.fromJson(json['person'] as Map<String, dynamic>),
      character: json['character'] as String,
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$CreditModelToJson(CreditModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'person': instance.person,
      'character': instance.character,
      'order': instance.order,
    };
