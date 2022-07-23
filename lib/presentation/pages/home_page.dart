import 'package:flutter/material.dart';

import 'package:flutter_financial_chart/data/models/market_info_model.dart';
import 'package:flutter_financial_chart/data/repositories/mock_repository.dart';
import 'package:flutter_financial_chart/presentation/widgets/candle_chart/candle_chart_painter.dart';
import 'package:flutter_financial_chart/presentation/widgets/line_chart/line_chart_painter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(elevation: 0, title: Text(widget.title)),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: StreamBuilder<MarketInformationModel>(
            stream: MockRepository().subscribeMarket(),
            builder: (
              BuildContext context,
              AsyncSnapshot<MarketInformationModel> snapshot,
            ) {
              return Column(
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
              );
            },
          ),
        ),
      );

  Widget _buildCandleChart(AsyncSnapshot<MarketInformationModel> snapshot) =>
      CustomPaint(
        size: Size.infinite,
        painter: CandleChartPainter(timeSeries: snapshot.data?.candles),
      );
}

CustomPaint _buildLineChart(AsyncSnapshot<MarketInformationModel> snapshot) =>
    CustomPaint(
      size: Size.infinite,
      painter: LineChartPainter(timeSeries: snapshot.data?.candles),
    );
