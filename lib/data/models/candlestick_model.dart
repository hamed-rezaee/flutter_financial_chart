import 'dart:convert';

class CandleStickModel {
  CandleStickModel({
    required this.time,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });

  factory CandleStickModel.fromMap(DateTime time, Map<String, dynamic> json) =>
      CandleStickModel(
        time: time,
        open: double.parse(json["open"]),
        high: double.parse(json["high"]),
        low: double.parse(json["low"]),
        close: double.parse(json["close"]),
        volume: double.parse(json["volume"]),
      );

  factory CandleStickModel.fromJson(DateTime time, String data) =>
      CandleStickModel.fromMap(time, json.decode(data));

  final DateTime time;
  final double open;
  final double high;
  final double low;
  final double close;
  final double volume;
}
