import 'package:flutter/material.dart';

class LineChartModel {
  LineChartModel({
    required this.value,
    required this.timestamp,
    required this.paint,
  });

  final double value;
  final double timestamp;
  final Paint paint;
}
