import 'package:daily_quotes/data/page_data.dart';
import 'package:json_annotation/json_annotation.dart';

part '../generated/data/query_data.g.dart';


@JsonSerializable()
class QueryData {
  final Map<int, PageData> pages;

  QueryData(this.pages);

  factory QueryData.fromJson(Map<String, dynamic> json) =>
      _$QueryDataFromJson(json);

  Map<String, dynamic> toJson() => _$QueryDataToJson(this);
}
