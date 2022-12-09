// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accession.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accession _$AccessionFromJson(Map<String, dynamic> json) => Accession(
      json['id'] as String,
      json['code'] as String,
      json['year'] as String,
      json['invQuantity'] as int,
    );

Map<String, dynamic> _$AccessionToJson(Accession instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'year': instance.year,
      'invQuantity': instance.invQuantity,
    };
