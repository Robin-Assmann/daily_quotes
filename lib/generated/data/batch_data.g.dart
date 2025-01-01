// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../data/batch_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchData _$BatchDataFromJson(Map<String, dynamic> json) => BatchData(
      json['batchcomplete'] as String?,
      QueryData.fromJson(json['query'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BatchDataToJson(BatchData instance) => <String, dynamic>{
      'batchcomplete': instance.batchcomplete,
      'query': instance.query,
    };
