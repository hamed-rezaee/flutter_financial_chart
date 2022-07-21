import 'package:flutter/material.dart';
import 'package:flutter_financial_chart/data/models/time_series_model.dart';
import 'package:flutter_financial_chart/data/repositories/mock_repository.dart';
import 'package:flutter_financial_chart/presentation/widgets/candle_chart/candle_chart_painter.dart';

import 'package:flutter_financial_chart/presentation/widgets/line_chart/line_chart_painter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(elevation: 0, title: Text(title)),
        body: Center(
          child: FutureBuilder<TimeSeriesModel>(
            future: MockRepository().fetchTimeSeries(page: 2, pageSize: 50),
            builder: (
              BuildContext context,
              AsyncSnapshot<TimeSeriesModel> snapshot,
            ) =>
                Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 160,
                  child: CustomPaint(
                    size: Size.infinite,
                    painter: CandleChartPainter(
                      timeSeries: snapshot.data?.candles,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: CustomPaint(
                    size: Size.infinite,
                    painter: LineChartPainter(
                      timeSeries: snapshot.data?.candles,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
