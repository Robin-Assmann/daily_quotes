import 'package:daily_quotes/data/query_data.dart';
import 'package:json_annotation/json_annotation.dart';

part '../generated/data/batch_data.g.dart';


@JsonSerializable()
class BatchData {
  final String? batchcomplete;
  final QueryData query;

  BatchData(this.batchcomplete, this.query);

  factory BatchData.fromJson(Map<String, dynamic> json) =>
      _$BatchDataFromJson(json);

  Map<String, dynamic> toJson() => _$BatchDataToJson(this);
}
