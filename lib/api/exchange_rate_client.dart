import 'package:messari_api/api/config/lib.dart';
import 'package:messari_api/api/models/exchange_rate_data.dart';
import 'package:messari_api/api/responses/asset_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'exchange_rate_client.g.dart';

@RestApi(baseUrl: EXCHANGE_RATE_BASE_URL)
abstract class ExchangeRateClient {
  factory ExchangeRateClient(Dio dio) = _ExchangeRateClient;

  @GET("")
  Future<ExchangeRateData> getRates(
      {@Query("base") String? baseCurrency = "USD",
      @Query("symbols") String? outputCurrencies,
      @Query("amount") double? amount,
      @Query("places") int? decimalPlaces});
}
