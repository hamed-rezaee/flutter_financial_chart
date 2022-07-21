import 'package:flutter/services.dart';
import 'package:flutter_financial_chart/data/models/candlestick_model.dart';

import 'package:flutter_financial_chart/data/models/time_series_model.dart';
import 'package:flutter_financial_chart/data/repositories/base_repository.dart';

class MockRepository implements BaseRepository {
  @override
  Future<TimeSeriesModel> fetchTimeSeries({
    String symbol = 'IBM',
    int interval = 5,
    int page = 0,
    int pageSize = 50,
  }) async {
    TimeSeriesModel timeSeries = TimeSeriesModel.fromJson(
      await rootBundle
          .loadString('assets/mock_data/symbol_ibm/${interval}_min.json'),
    );

    return TimeSeriesModel(
      metaData: timeSeries.metaData,
      candles: timeSeries.candles.sublist(
        timeSeries.candles.length - (page + 1) * pageSize,
        timeSeries.candles.length - page * pageSize,
      ),
    );
  }

  @override
  Stream<TimeSeriesModel> subscribeTimeSeries({
    String symbol = 'IBM',
    int interval = 5,
    int pageSize = 50,
  }) async* {
    TimeSeriesModel timeSeries = TimeSeriesModel.fromJson(
      await rootBundle
          .loadString('assets/mock_data/symbol_ibm/${interval}_min.json'),
    );

    List<CandleStickModel> candleStick =
        timeSeries.candles.sublist(0, pageSize);

    for (int i = pageSize; i < timeSeries.candles.length; i++) {
      await Future<void>.delayed(const Duration(seconds: 1));

      yield TimeSeriesModel(
        metaData: timeSeries.metaData,
        candles: candleStick
          ..removeAt(0)
          ..insert(pageSize - 1, timeSeries.candles[i + pageSize - 1]),
      );
    }
  }
}
