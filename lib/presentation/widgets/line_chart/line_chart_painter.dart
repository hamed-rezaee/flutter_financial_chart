import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_financial_chart/data/models/candlestick_model.dart';
import 'package:flutter_financial_chart/presentation/widgets/line_chart/line_chart_model.dart';

class LineChartPainter extends CustomPainter {
  LineChartPainter({
    this.timeSeries,
    Paint? gainPaint,
    Paint? lossPaint,
  })  : _gainPaint = gainPaint ?? Paint()
          ..color = Colors.green.withOpacity(0.5),
        _lossPaint = lossPaint ?? Paint()
          ..color = Colors.red.withOpacity(0.5);

  final Map<String, CandleStickModel>? timeSeries;
  final Paint _gainPaint;
  final Paint _lossPaint;

  @override
  void paint(Canvas canvas, Size size) {
    if (timeSeries == null) {
      return;
    }

    final List<LineChartModel> bars = _generateBars(size);

    for (final LineChartModel bar in bars) {
      canvas.drawRect(
        Rect.fromLTWH(
          bar.centerX - (bar.width / 2),
          size.height - bar.height,
          bar.width,
          bar.height,
        ),
        bar.paint,
      );
    }
  }

  List<LineChartModel> _generateBars(Size size) {
    final double pixelPerWidth = size.width / (timeSeries!.keys.length + 1);
    final double pixelPerHigh = size.height /
        timeSeries!.values.map((item) => item.volume).reduce(math.max);

    List<LineChartModel> bars = [];

    for (int i = 0; i < timeSeries!.entries.length; i++) {
      final MapEntry<String, CandleStickModel> currentElement =
          timeSeries!.entries.elementAt(i);
      final bool isGain = currentElement.value.open <
          timeSeries!.entries.elementAt(i).value.close;

      bars.add(
        LineChartModel(
          width: 3,
          height: currentElement.value.volume * pixelPerHigh,
          centerX: (i + 1) * pixelPerWidth,
          paint: isGain ? _gainPaint : _lossPaint,
        ),
      );
    }

    return bars;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
