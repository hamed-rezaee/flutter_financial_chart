import 'package:flutter/material.dart';

class CandleChartModel {
  CandleChartModel({
    required this.centerX,
    required this.wickHighY,
    required this.wickLowY,
    required this.candleHighY,
    required this.candleLowY,
    required this.candlePaint,
  });

  final double centerX;
  final double wickHighY;
  final double wickLowY;
  final double candleHighY;
  final double candleLowY;
  final Paint candlePaint;
}
