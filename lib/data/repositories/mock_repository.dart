import 'package:flutter/services.dart';

import 'package:flutter_financial_chart/data/models/candle_model.dart';
import 'package:flutter_financial_chart/data/models/market_info_model.dart';
import 'package:flutter_financial_chart/data/repositories/base_repository.dart';

class MockRepository implements BaseRepository {
  @override
  Future<MarketInformationModel> fetchMarket({
    String symbol = '1HZ300V',
    int interval = 5,
    int page = 0,
    int pageSize = 50,
  }) async {
    MarketInformationModel marketInformation = MarketInformationModel.fromJson(
      await rootBundle
          .loadString('assets/mock_data/$symbol/${interval}_min.json'),
    );

    return MarketInformationModel(
      metaData: marketInformation.metaData,
      candles: marketInformation.candles.sublist(
        marketInformation.candles.length - (page + 1) * pageSize,
        marketInformation.candles.length - page * pageSize,
      ),
    );
  }

  @override
  Stream<MarketInformationModel> subscribeMarket({
    String symbol = '1HZ300V',
    int interval = 5,
    int pageSize = 50,
  }) async* {
    MarketInformationModel marketInformation = MarketInformationModel.fromJson(
      await rootBundle
          .loadString('assets/mock_data/$symbol/${interval}_min.json'),
    );

    List<CandleModel> candle = marketInformation.candles.sublist(0, pageSize);

    for (int i = pageSize; i < marketInformation.candles.length; i++) {
      await Future<void>.delayed(const Duration(seconds: 1));

      yield MarketInformationModel(
        metaData: marketInformation.metaData,
        candles: candle
          ..removeAt(0)
          ..insert(pageSize - 1, marketInformation.candles[i + pageSize - 1]),
      );
    }
  }
}
