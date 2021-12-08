import 'package:json_annotation/json_annotation.dart';
import 'package:messari_api/api/models/asset_metric.dart';
import 'package:messari_api/api/models/status.dart';

part 'asset_metrics_response.g.dart';

@JsonSerializable()
class AssetMetricsResponse {
  Status status;

  @JsonKey(name: 'data')
  AssetMetric assetMetric;

  AssetMetricsResponse(this.status, this.assetMetric);

  factory AssetMetricsResponse.fromJson(Map<String, dynamic> json) =>
      _$AssetMetricsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AssetMetricsResponseToJson(this);
}
