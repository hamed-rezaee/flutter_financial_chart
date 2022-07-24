import 'package:flutter/services.dart';

import 'package:flutter_financial_chart/data/models/candle_model.dart';
import 'package:flutter_financial_chart/data/models/candle_information_model.dart';
import 'package:flutter_financial_chart/data/models/history_model.dart';
import 'package:flutter_financial_chart/data/models/tick_information_model.dart';
import 'package:flutter_financial_chart/data/repositories/base_repository.dart';

class MockRepository implements BaseRepository {
  @override
  Future<CandleInformationModel> fetchMarket({
    String symbol = '1hz300v',
    int page = 0,
    int pageSize = 50,
  }) async {
    CandleInformationModel marketInformation = CandleInformationModel.fromJson(
      await rootBundle.loadString('assets/mock_data/candle/$symbol.json'),
    );

    return CandleInformationModel(
      metaData: marketInformation.metaData,
      candles: marketInformation.candles.sublist(
        marketInformation.candles.length - (page + 1) * pageSize,
        marketInformation.candles.length - page * pageSize,
      ),
    );
  }

  @override
  Stream<CandleInformationModel> subscribeMarket({
    String symbol = '1hz300v',
    int pageSize = 50,
  }) async* {
    CandleInformationModel marketInformation = CandleInformationModel.fromJson(
      await rootBundle.loadString('assets/mock_data/candle/$symbol.json'),
    );

    List<CandleModel> candle = marketInformation.candles.sublist(0, pageSize);

    for (int i = pageSize; i < marketInformation.candles.length; i++) {
      await Future<void>.delayed(const Duration(seconds: 1));

      yield CandleInformationModel(
        metaData: marketInformation.metaData,
        candles: candle
          ..removeAt(0)
          ..insert(pageSize - 1, marketInformation.candles[i + pageSize - 1]),
      );
    }
  }

  @override
  Stream<TickInformationModel> subscribeTick({
    String symbol = '1hz300v',
    int pageSize = 50,
  }) async* {
    TickInformationModel marketInformation = TickInformationModel.fromJson(
      await rootBundle.loadString('assets/mock_data/tick/$symbol.json'),
    );

    List<double> prices = marketInformation.history.prices.sublist(0, pageSize);

    for (int i = pageSize; i < marketInformation.history.prices.length; i++) {
      await Future<void>.delayed(const Duration(seconds: 1));

      yield TickInformationModel(
        metaData: marketInformation.metaData,
        history: HistoryModel(
          prices: prices
            ..removeAt(0)
            ..insert(pageSize - 1, prices[i + pageSize - 1]),
          times: marketInformation.history.times
            ..remove(0)
            ..insert(
              pageSize - 1,
              marketInformation.history.times[i + pageSize - 1],
            ),
        ),
      );
    }
  }
}
