// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../data/page_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageData _$PageDataFromJson(Map<String, dynamic> json) => PageData(
      (json['pageId'] as num?)?.toInt(),
      (json['ns'] as num).toInt(),
      json['title'] as String,
      json['extract'] as String,
      json['thumbnail'] == null
          ? null
          : ThumbnailData.fromJson(json['thumbnail'] as Map<String, dynamic>),
      json['pageimage'] as String,
    );

Map<String, dynamic> _$PageDataToJson(PageData instance) => <String, dynamic>{
      'pageId': instance.pageId,
      'ns': instance.ns,
      'title': instance.title,
      'extract': instance.extract,
      'thumbnail': instance.thumbnail,
      'pageimage': instance.pageimage,
    };
