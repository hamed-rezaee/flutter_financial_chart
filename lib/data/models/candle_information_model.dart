import 'dart:convert';

import 'package:flutter_financial_chart/data/models/candle_model.dart';
import 'package:flutter_financial_chart/data/models/meta_data_model.dart';

class CandleInformationModel {
  CandleInformationModel({
    required this.metaData,
    required this.candles,
  });

  final MetaDataModel metaData;
  final List<CandleModel> candles;

  factory CandleInformationModel.fromJson(String string) =>
      CandleInformationModel.fromMap(json.decode(string));

  factory CandleInformationModel.fromMap(Map<String, dynamic> json) =>
      CandleInformationModel(
        metaData: MetaDataModel.fromMap(json["Meta Data"]),
        candles: List<CandleModel>.from(
          json["candles"].map((item) => CandleModel.fromMap(item)),
        ),
      );
}
