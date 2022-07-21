import 'dart:convert';

import 'package:flutter_financial_chart/data/models/candlestick_model.dart';
import 'package:flutter_financial_chart/data/models/meta_data_model.dart';

class TimeSeriesModel {
  TimeSeriesModel({
    required this.metaData,
    required this.candles,
  });

  final MetaDataModel metaData;
  final List<CandleStickModel> candles;

  factory TimeSeriesModel.fromMap(Map<String, dynamic> json) => TimeSeriesModel(
        metaData: MetaDataModel.fromMap(json["Meta Data"]),
        candles: Map.from(json["time_series"])
            .map(
              (key, value) => MapEntry(
                key,
                CandleStickModel.fromMap(DateTime.parse(key), value),
              ),
            )
            .values
            .toList(),
      );

  factory TimeSeriesModel.fromJson(String data) =>
      TimeSeriesModel.fromMap(json.decode(data));
}
