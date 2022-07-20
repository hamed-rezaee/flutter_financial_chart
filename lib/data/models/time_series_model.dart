import 'dart:convert';

import 'package:flutter_financial_chart/data/models/candlestick_model.dart';
import 'package:flutter_financial_chart/data/models/meta_data_model.dart';

class TimeSeriesModel {
  TimeSeriesModel({
    required this.metaData,
    required this.timeSeries,
  });

  final MetaDataModel metaData;
  final Map<String, CandleStickModel> timeSeries;

  factory TimeSeriesModel.fromMap(Map<String, dynamic> json) => TimeSeriesModel(
        metaData: MetaDataModel.fromMap(json["Meta Data"]),
        timeSeries: Map.from(json["time_series"]).map(
          (key, value) => MapEntry<String, CandleStickModel>(
            key,
            CandleStickModel.fromMap(value),
          ),
        ),
      );

  factory TimeSeriesModel.fromJson(String data) =>
      TimeSeriesModel.fromMap(json.decode(data));
}
