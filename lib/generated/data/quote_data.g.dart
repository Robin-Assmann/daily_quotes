// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../data/quote_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteData _$QuoteDataFromJson(Map<String, dynamic> json) => QuoteData(
      (json['id'] as num).toInt(),
      json['author'] as String,
      json['quoteText'] as String,
      json['source'] as String?,
      json['dataSet'] as String?,
      json['book'] as String?,
      json['categories'] as String,
      json['url'] as String?,
      json['isbn'] as String?,
      json['language'] as String,
      json['originalLanguage'] as String?,
      json['dateCreated'] as String,
    );

Map<String, dynamic> _$QuoteDataToJson(QuoteData instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'quoteText': instance.quoteText,
      'source': instance.source,
      'dataSet': instance.dataSet,
      'book': instance.book,
      'categories': instance.categories,
      'url': instance.url,
      'isbn': instance.isbn,
      'language': instance.language,
      'originalLanguage': instance.originalLanguage,
      'dateCreated': instance.dateCreated,
    };
