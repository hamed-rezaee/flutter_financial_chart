import 'package:flutter/services.dart';

import 'package:flutter_financial_chart/data/models/time_series_model.dart';
import 'package:flutter_financial_chart/data/repositories/base_repository.dart';

class MockRepository implements BaseRepository {
  @override
  Future<TimeSeriesModel> fetchTimeSeries({
    String symbol = 'IBM',
    int interval = 5,
  }) async {
    String rowData = await rootBundle
        .loadString('assets/mock_data/symbol_ibm/${interval}_min.json');

    return TimeSeriesModel.fromJson(rowData);
  }
}
