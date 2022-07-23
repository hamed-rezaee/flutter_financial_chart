import 'package:flutter/material.dart';

class ValueIndicator extends StatefulWidget {
  const ValueIndicator({required this.value, Key? key}) : super(key: key);

  final double value;

  @override
  State<ValueIndicator> createState() => _ValueIndicatorState();
}

class _ValueIndicatorState extends State<ValueIndicator> {
  Color _color = Colors.white;

  @override
  void didUpdateWidget(covariant ValueIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.value > oldWidget.value) {
      _color = Colors.red;
    } else if (widget.value < oldWidget.value) {
      _color = Colors.green;
    } else {
      _color = Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Text(
            widget.value.toStringAsFixed(2),
            style: TextStyle(
              color: _color,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            _color == Colors.green
                ? Icons.arrow_drop_up
                : _color == Colors.red
                    ? Icons.arrow_drop_down
                    : null,
            color: _color,
            size: 32,
          ),
        ],
      );
}
