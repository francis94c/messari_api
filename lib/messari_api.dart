library messari_api;

import 'dart:collection';

import 'package:messari_api/api/assets_client.dart';
import 'package:dio/dio.dart';
import 'package:messari_api/api/exchange_rate_client.dart';
import 'package:messari_api/api/models/exchange_rate_data.dart';
import 'package:messari_api/api/responses/asset_metrics_response.dart';
import 'package:messari_api/api/responses/asset_response.dart';

/// Messari API.
class MessariAPI {
  /// Assets Client.
  static late final AssetsClient _assetsClient = AssetsClient(Dio());
  static late final ExchangeRateClient _exchangeRateClient =
      ExchangeRateClient(Dio());

  static final SplayTreeMap<String, double> _xRateMap =
      SplayTreeMap<String, double>();

  /// Get Crypto Asset.
  static Future<AssetResponse> getAsset(String assetId) async =>
      await _assetsClient.getAsset(assetId);

  /// Get Crypto Asset Metrics.
  static Future<AssetMetricsResponse> getMetrics(String assetId) async {
    AssetMetricsResponse response = await _assetsClient.getMetrics(assetId);
    _xRateMap[response.assetMetric.slug] =
        response.assetMetric.marketData.priceUsd;
    return response;
  }

  /// Convert crypto asset value to dollars
  ///
  /// [slug] is the slug of the crypto asset, e.g bitcoin, etherum, etc.
  /// [assetVal] is the crypto asset value.
  ///
  /// Returns the converted value in dollars.
  static Future<double> cryptoToDollars(String slug, double assetVal,
      {bool useCache = true}) async {
    if (_xRateMap.containsKey(slug)) {
      return _xRateMap[slug]! * assetVal;
    } else {
      AssetMetricsResponse response = await getMetrics(slug);
      return response.assetMetric.marketData.priceUsd * assetVal;
    }
  }

  /// Convert crypto asset to fiat value.
  static Future<double?> cryptoToFiat(
      String assetSlug, double assetVal, String fiatCurrency,
      {bool useCache = true}) async {
    double dollarVal =
        await cryptoToDollars(assetSlug, assetVal, useCache: useCache);

    ExchangeRateData response = await _exchangeRateClient.getRates(
        baseCurrency: "USD", outputCurrencies: fiatCurrency.toUpperCase());

    if (!response.rates.containsKey(fiatCurrency.toUpperCase())) return null;

    return dollarVal * response.rates[fiatCurrency.toUpperCase()]!;
  }
}
