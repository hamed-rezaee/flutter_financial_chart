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
        open: double.parse(json["open"]),
        high: double.parse(json["high"]),
        low: double.parse(json["low"]),
        close: double.parse(json["close"]),
        volume: double.parse(json["volume"]),
      );

  factory CandleStickModel.fromJson(String data) =>
      CandleStickModel.fromMap(json.decode(data));

  final double open;
  final double high;
  final double low;
  final double close;
  final double volume;
}
