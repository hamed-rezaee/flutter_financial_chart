import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_financial_chart/data/models/history_model.dart';
import 'package:flutter_financial_chart/presentation/widgets/line_chart/line_chart_model.dart';

class LineChartPainter extends CustomPainter {
  LineChartPainter({
    required this.values,
    Paint? paint,
  }) : _paint = paint ?? Paint()
          ..color = Colors.red;

  final HistoryModel? values;
  final Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    if (values == null) {
      return;
    }

    final List<LineChartModel> points = _generateLines(size);
    double partitionSize = size.width / values!.prices.length + 1;

    for (int i = 0; i < points.length; i++) {
      canvas.drawPath(
        Path()
          ..moveTo(partitionSize + i, size.height - points[i].value)
          ..lineTo(size.width, size.height - points[i].value),
        _paint,
      );
    }
  }

  List<LineChartModel> _generateLines(Size size) {
    final List<LineChartModel> lines = [];

    if (values != null) {
      double max = values!.prices.reduce(math.max);
      double min = values!.prices.reduce(math.min);
      double scale = size.height / (max - min);

      for (int i = 0; i < values!.prices.length; i++) {
        lines.add(
          LineChartModel(
            value: values!.prices[i] * scale,
            timestamp: values!.times[i],
            paint: _paint,
          ),
        );
      }
    }

    return lines;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      this != oldDelegate;
}
