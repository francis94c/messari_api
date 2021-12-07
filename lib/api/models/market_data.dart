import 'package:json_annotation/json_annotation.dart';

part 'market_data.g.dart';

@JsonSerializable()
class MarketData {
  MarketData();

  factory MarketData.fromJson(Map<String, dynamic> json) =>
      _$MarketDataFromJson(json);

  Map<String, dynamic> toJson() => _$MarketDataToJson(this);
}
