// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../data/query_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryData _$QueryDataFromJson(Map<String, dynamic> json) => QueryData(
      (json['pages'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k), PageData.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$QueryDataToJson(QueryData instance) => <String, dynamic>{
      'pages': instance.pages.map((k, e) => MapEntry(k.toString(), e)),
    };
