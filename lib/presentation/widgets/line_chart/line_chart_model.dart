import 'package:flutter/material.dart';

class LineChartModel {
  LineChartModel({
    required this.width,
    required this.height,
    required this.centerX,
    required this.paint,
  });

  final double width;
  final double height;
  final double centerX;
  final Paint paint;
}
