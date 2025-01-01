// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../data/thumbnail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThumbnailData _$ThumbnailDataFromJson(Map<String, dynamic> json) =>
    ThumbnailData(
      json['source'] as String,
      (json['width'] as num).toInt(),
      (json['height'] as num).toInt(),
    );

Map<String, dynamic> _$ThumbnailDataToJson(ThumbnailData instance) =>
    <String, dynamic>{
      'source': instance.source,
      'width': instance.width,
      'height': instance.height,
    };
