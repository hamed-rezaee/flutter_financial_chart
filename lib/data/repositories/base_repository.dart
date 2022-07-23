import 'package:flutter_financial_chart/data/models/market_info_model.dart';

abstract class BaseRepository {
  Future<MarketInformationModel> fetchMarket({
    required String symbol,
    required int interval,
    int page,
    int pageSize,
  });

  Stream<MarketInformationModel> subscribeMarket({
    required String symbol,
    required int interval,
  });
}
