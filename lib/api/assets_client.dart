import 'package:messari_api/api/config/lib.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'assets_client.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class AssetsClient {
  factory AssetsClient(Dio dio) = _AssetsClient;

  @GET("assets/{assetId}")
  Future<void> getAsset(@Path("assetId") String assetId);

  @GET("assets/{assetId}/metrics")
  Future<void> getMetrics(@Path("assetId") String assetId);
}
