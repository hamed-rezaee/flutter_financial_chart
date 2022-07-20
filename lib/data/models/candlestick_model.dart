import 'dart:convert';

class CandleStickModel {
  CandleStickModel({
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });

  factory CandleStickModel.fromMap(Map<String, dynamic> json) =>
      CandleStickModel(
        open: json["open"],
        high: json["high"],
        low: json["low"],
        close: json["close"],
        volume: json["volume"],
      );

  factory CandleStickModel.fromJson(String data) =>
      CandleStickModel.fromMap(json.decode(data));

  final String open;
  final String high;
  final String low;
  final String close;
  final String volume;
}
