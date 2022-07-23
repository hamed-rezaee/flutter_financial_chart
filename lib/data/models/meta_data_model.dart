import 'dart:convert';

class MetaDataModel {
  MetaDataModel({
    required this.symbol,
    required this.symbolName,
    required this.market,
    required this.submarket,
  });

  final String symbol;
  final String symbolName;
  final String market;
  final String submarket;

  factory MetaDataModel.fromJson(String string) =>
      MetaDataModel.fromMap(json.decode(string));

  factory MetaDataModel.fromMap(Map<String, dynamic> json) => MetaDataModel(
        symbol: json["symbol"],
        symbolName: json["symbol_name"],
        market: json["market"],
        submarket: json["submarket"],
      );
}
