import 'package:daily_quotes/data/thumbnail_data.dart';
import 'package:json_annotation/json_annotation.dart';

part '../generated/data/page_data.g.dart';


@JsonSerializable()
class PageData {
  final int? pageId;
  final int ns;
  final String title;
  final String extract;
  final ThumbnailData? thumbnail;
  final String pageimage;

  PageData(this.pageId, this.ns, this.title, this.extract, this.thumbnail, this.pageimage);

  factory PageData.fromJson(Map<String, dynamic> json) =>
      _$PageDataFromJson(json);

  Map<String, dynamic> toJson() => _$PageDataToJson(this);
}
