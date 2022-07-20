import 'package:flutter/material.dart';

import 'package:flutter_financial_chart/data/models/time_series_model.dart';
import 'package:flutter_financial_chart/data/repositories/mock_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(elevation: 0, title: Text(title)),
        body: Center(
          child: FutureBuilder<TimeSeriesModel>(
            future: MockRepository().fetchTimeSeries(),
            builder: (context, snapshot) => snapshot.hasData
                ? Text(snapshot.data!.timeSeries['2022-07-19 20:00:00']!.close
                    .toString())
                : const CircularProgressIndicator(),
          ),
        ),
      );
}
