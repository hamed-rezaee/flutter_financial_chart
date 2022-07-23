import 'dart:convert';

import 'package:flutter_financial_chart/data/models/candle_model.dart';
import 'package:flutter_financial_chart/data/models/meta_data_model.dart';

class MarketInformationModel {
  MarketInformationModel({
    required this.metaData,
    required this.candles,
  });

  final MetaDataModel metaData;
  final List<CandleModel> candles;

  factory MarketInformationModel.fromJson(String string) =>
      MarketInformationModel.fromMap(json.decode(string));

  factory MarketInformationModel.fromMap(Map<String, dynamic> json) =>
      MarketInformationModel(
        metaData: MetaDataModel.fromMap(json["Meta Data"]),
        candles: List<CandleModel>.from(
          json["candles"].map((item) => CandleModel.fromMap(item)),
        ),
      );
}
