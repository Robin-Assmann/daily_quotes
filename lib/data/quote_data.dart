import 'package:json_annotation/json_annotation.dart';

part '../generated/data/quote_data.g.dart';


@JsonSerializable()
class QuoteData {
  final int id;
  final String author;
  final String quoteText;
  final String? source;
  final String? dataSet;
  final String? book;
  final String categories;
  final String? url;
  final String? isbn;
  final String language;
  final String? originalLanguage;
  final String dateCreated;

  QuoteData(
      this.id,
      this.author,
      this.quoteText,
      this.source,
      this.dataSet,
      this.book,
      this.categories,
      this.url,
      this.isbn,
      this.language,
      this.originalLanguage,
      this.dateCreated);

  factory QuoteData.fromJson(Map<String, dynamic> json) =>
      _$QuoteDataFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteDataToJson(this);
}
