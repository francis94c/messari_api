import 'package:json_annotation/json_annotation.dart';
import 'package:messari_api/api/models/market_data.dart';

part 'asset_metric.g.dart';

@JsonSerializable()
class AssetMetric {
  String id;
  String symbol;
  String name;
  String slug;

  @JsonKey(name: 'market_data')
  MarketData marketData;

  AssetMetric(this.id, this.symbol, this.name, this.slug, this.marketData);

  factory AssetMetric.fromJson(Map<String, dynamic> json) =>
      _$AssetMetricFromJson(json);

  Map<String, dynamic> toJson() => _$AssetMetricToJson(this);
}
