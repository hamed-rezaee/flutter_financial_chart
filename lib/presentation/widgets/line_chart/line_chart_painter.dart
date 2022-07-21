import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_financial_chart/data/models/candlestick_model.dart';
import 'package:flutter_financial_chart/presentation/widgets/line_chart/line_model.dart';

class LineChartPainter extends CustomPainter {
  LineChartPainter({
    this.timeSeries,
    Paint? gainPaint,
    Paint? lossPaint,
  })  : _gainPaint = gainPaint ?? Paint()
          ..color = Colors.green.withOpacity(0.5),
        _lossPaint = lossPaint ?? Paint()
          ..color = Colors.red.withOpacity(0.5);

  final List<CandleStickModel>? timeSeries;
  final Paint _gainPaint;
  final Paint _lossPaint;

  @override
  void paint(Canvas canvas, Size size) {
    if (timeSeries == null) {
      return;
    }

    final List<LineModel> bars = _generateBars(size);

    for (final LineModel bar in bars) {
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

  List<LineModel> _generateBars(Size size) {
    final double pixelPerWidth = size.width / (timeSeries!.length + 1);
    final double pixelPerHigh =
        size.height / timeSeries!.map((item) => item.volume).reduce(math.max);

    List<LineModel> bars = [];

    for (int i = 0; i < timeSeries!.length; i++) {
      final CandleStickModel currentElement = timeSeries![i];
      final bool isGain = currentElement.open < currentElement.close;

      bars.add(
        LineModel(
          width: 6,
          height: currentElement.volume * pixelPerHigh,
          centerX: (i + 1) * pixelPerWidth,
          paint: isGain ? _gainPaint : _lossPaint,
        ),
      );
    }

    return bars;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      this != oldDelegate;
}
