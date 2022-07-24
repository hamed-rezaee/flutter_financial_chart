import 'package:flutter_financial_chart/data/models/candle_information_model.dart';
import 'package:flutter_financial_chart/data/models/tick_information_model.dart';

abstract class BaseRepository {
  Future<CandleInformationModel> fetchMarket({
    String symbol,
    int page,
    int pageSize,
  });

  Stream<CandleInformationModel> subscribeMarket({
    String symbol,
    int pageSize,
  });

  Stream<TickInformationModel> subscribeTick({
    String symbol,
    int pageSize,
  });
}
