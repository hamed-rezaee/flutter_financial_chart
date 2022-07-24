import 'dart:convert';

import 'package:flutter_financial_chart/data/models/history_model.dart';
import 'package:flutter_financial_chart/data/models/meta_data_model.dart';

class TickInformationModel {
  TickInformationModel({
    required this.metaData,
    required this.history,
  });

  final MetaDataModel metaData;
  final HistoryModel history;

  factory TickInformationModel.fromJson(String string) =>
      TickInformationModel.fromMap(json.decode(string));

  factory TickInformationModel.fromMap(Map<String, dynamic> json) =>
      TickInformationModel(
        metaData: MetaDataModel.fromMap(json["Meta Data"]),
        history: HistoryModel.fromMap(json["history"]),
      );
}
