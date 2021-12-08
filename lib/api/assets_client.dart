import 'package:messari_api/api/config/lib.dart';
import 'package:messari_api/api/responses/asset_metrics_response.dart';
import 'package:messari_api/api/responses/asset_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'assets_client.g.dart';

@RestApi(baseUrl: MESSARI_BASE_URL)
abstract class AssetsClient {
  factory AssetsClient(Dio dio) = _AssetsClient;

  @GET("assets/{assetId}")
  Future<AssetResponse> getAsset(@Path("assetId") String assetId);

  @GET("assets/{assetId}/metrics")
  Future<AssetMetricsResponse> getMetrics(@Path("assetId") String assetId);
}
