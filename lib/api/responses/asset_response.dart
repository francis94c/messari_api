import 'package:json_annotation/json_annotation.dart';
import 'package:messari_api/api/models/asset.dart';
import 'package:messari_api/api/models/status.dart';

part 'asset_response.g.dart';

@JsonSerializable()
class AssetResponse {
  Status status;

  @JsonKey(name: 'data')
  Asset asset;

  AssetResponse(this.status, this.asset);

  factory AssetResponse.fromJson(Map<String, dynamic> json) =>
      _$AssetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AssetResponseToJson(this);
}
