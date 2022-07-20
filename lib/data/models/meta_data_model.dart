import 'dart:convert';

class MetaDataModel {
  MetaDataModel({
    required this.symbol,
    required this.lastRefreshed,
    required this.interval,
  });

  factory MetaDataModel.fromMap(Map<String, dynamic> json) => MetaDataModel(
        symbol: json["symbol"],
        lastRefreshed: DateTime.parse(json["last_refreshed"]),
        interval: json["interval"],
      );

  factory MetaDataModel.fromJson(String data) =>
      MetaDataModel.fromMap(json.decode(data));

  final String symbol;
  final DateTime lastRefreshed;
  final String interval;
}
