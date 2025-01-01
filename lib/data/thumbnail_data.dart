import 'package:json_annotation/json_annotation.dart';

part '../generated/data/thumbnail_data.g.dart';


@JsonSerializable()
class ThumbnailData {
  final String source;
  final int width;
  final int height;

  ThumbnailData(this.source, this.width, this.height);

  factory ThumbnailData.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailDataFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailDataToJson(this);
}
