import 'package:json_annotation/json_annotation.dart';

part 'market_data.g.dart';

@JsonSerializable()
class MarketData {
  @JsonKey(name: 'price_usd')
  final double priceUsd;
  @JsonKey(name: 'price_btc')
  final double priceBtc;
  @JsonKey(name: 'volume_last_24_hours')
  final double volumeLast24Hours;
  @JsonKey(name: 'real_volume_last_24_hours')
  final double realVolumeLast24Hours;
  @JsonKey(name: 'volume_last_24_hours_overstatement_multiple')
  final double volumeLast24HoursOverstatementMultiple;
  @JsonKey(name: 'percent_change_usd_last_24_hours')
  final double percentageChangeUsdLast24Hours;
  @JsonKey(name: 'percent_change_btc_last_24_hours')
  final double percentageChangeBtcLast24Hours;

  MarketData(
      this.priceUsd,
      this.priceBtc,
      this.volumeLast24Hours,
      this.realVolumeLast24Hours,
      this.volumeLast24HoursOverstatementMultiple,
      this.percentageChangeUsdLast24Hours,
      this.percentageChangeBtcLast24Hours);

  factory MarketData.fromJson(Map<String, dynamic> json) =>
      _$MarketDataFromJson(json);

  Map<String, dynamic> toJson() => _$MarketDataToJson(this);
}
