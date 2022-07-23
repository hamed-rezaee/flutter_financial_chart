import 'package:flutter/material.dart';

import 'package:flutter_financial_chart/data/models/market_info_model.dart';
import 'package:flutter_financial_chart/data/repositories/mock_repository.dart';
import 'package:flutter_financial_chart/presentation/widgets/candle_chart/candle_chart_painter.dart';
import 'package:flutter_financial_chart/presentation/widgets/duration_selector.dart';
import 'package:flutter_financial_chart/presentation/widgets/line_chart/line_chart_painter.dart';
import 'package:flutter_financial_chart/presentation/widgets/value_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedDuration = 5;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(elevation: 0, title: Text(widget.title)),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: StreamBuilder<MarketInformationModel>(
            stream:
                MockRepository().subscribeMarket(interval: _selectedDuration),
            builder: (
              BuildContext context,
              AsyncSnapshot<MarketInformationModel> snapshot,
            ) =>
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  snapshot.data?.metaData == null
                      ? ''
                      : '${snapshot.data?.metaData.symbolName} (${snapshot.data?.metaData.symbol})',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  snapshot.data?.metaData.market ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                ValueIndicator(value: _getValue(snapshot.data)),
                const SizedBox(height: 32),
                snapshot.connectionState == ConnectionState.waiting
                    ? const SizedBox(
                        height: 228,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : Column(
                        children: <Widget>[
                          SizedBox(
                            width: double.infinity,
                            height: 192,
                            child: _buildCandleChart(snapshot),
                          ),
                          const SizedBox(height: 4),
                          SizedBox(
                            width: double.infinity,
                            height: 32,
                            child: _buildLineChart(snapshot),
                          ),
                        ],
                      ),
                const SizedBox(height: 8),
                DurationSelector(
                  selectedDuration: _selectedDuration,
                  onSelected: (int duration) {
                    if (duration != _selectedDuration) {
                      setState(() => _selectedDuration = duration);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildCandleChart(AsyncSnapshot<MarketInformationModel> snapshot) =>
      CustomPaint(
        size: Size.infinite,
        painter: CandleChartPainter(timeSeries: snapshot.data?.candles),
      );

  CustomPaint _buildLineChart(AsyncSnapshot<MarketInformationModel> snapshot) =>
      CustomPaint(
        size: Size.infinite,
        painter: LineChartPainter(timeSeries: snapshot.data?.candles),
      );

  double _getValue(MarketInformationModel? data) => data == null
      ? 0
      : (data.candles.last.close + data.candles.last.close) / 2;
}
