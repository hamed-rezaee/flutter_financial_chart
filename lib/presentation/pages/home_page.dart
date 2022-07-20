import 'package:flutter/material.dart';
import 'package:flutter_financial_chart/data/models/time_series_model.dart';
import 'package:flutter_financial_chart/data/repositories/mock_repository.dart';

import 'package:flutter_financial_chart/presentation/widgets/line_chart/line_chart_painter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(elevation: 0, title: Text(title)),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 160,
                color: Colors.green,
              ),
              const SizedBox(height: 2),
              SizedBox(
                height: 30,
                child: FutureBuilder<TimeSeriesModel>(
                  future: MockRepository().fetchTimeSeries(),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<TimeSeriesModel> snapshot,
                  ) =>
                      CustomPaint(
                    size: Size.infinite,
                    painter: LineChartPainter(
                      timeSeries: snapshot.data?.timeSeries,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
