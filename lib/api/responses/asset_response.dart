import 'package:json_annotation/json_annotation.dart';
import 'package:messari_api/api/models/asset.dart';

part 'asset_response.g.dart';

@JsonSerializable()
class AssetResponse {
  @JsonKey(name: 'asset')
  Asset? asset;

  AssetResponse();

  factory AssetResponse.fromJson(Map<String, dynamic> json) =>
      _$AssetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AssetResponseToJson(this);
}
