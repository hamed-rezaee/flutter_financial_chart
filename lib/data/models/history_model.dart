import 'dart:convert';

class HistoryModel {
  HistoryModel({
    required this.prices,
    required this.times,
  });

  final List<double> prices;
  final List<int> times;

  factory HistoryModel.fromJson(String string) =>
      HistoryModel.fromMap(json.decode(string));

  factory HistoryModel.fromMap(Map<String, dynamic> json) => HistoryModel(
        prices:
            List<double>.from(json["prices"].map((item) => item.toDouble())),
        times: List<int>.from(json["times"].map((item) => item)),
      );
}
