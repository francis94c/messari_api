import 'package:json_annotation/json_annotation.dart';

part 'exchange_rate_data.g.dart';

@JsonSerializable()
class ExchangeRateData {
  final String base;
  final String date;
  final Map<String, double> rates;

  ExchangeRateData(this.base, this.date, this.rates);

  factory ExchangeRateData.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRateDataFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeRateDataToJson(this);
}
