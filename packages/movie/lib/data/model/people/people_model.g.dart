// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeopleModel _$PeopleModelFromJson(Map<String, dynamic> json) => PeopleModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      photo: json['profile'] as String,
    );

Map<String, dynamic> _$PeopleModelToJson(PeopleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile': instance.photo,
    };
