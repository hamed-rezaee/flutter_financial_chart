import 'dart:convert';
import 'dart:math';

class CandleModel {
  CandleModel({
    required this.close,
    required this.epoch,
    required this.high,
    required this.low,
    required this.open,
    required this.volume,
  });

  final double close;
  final int epoch;
  final double high;
  final double low;
  final double open;
  final int volume;

  factory CandleModel.fromJson(String string) =>
      CandleModel.fromMap(json.decode(string));

  factory CandleModel.fromMap(Map<String, dynamic> json) => CandleModel(
        close: json["close"].toDouble(),
        epoch: json["epoch"],
        high: json["high"].toDouble(),
        low: json["low"].toDouble(),
        open: json["open"].toDouble(),
        volume: (Random().nextInt(100) + 1),
      );
}
