import 'package:flutter/material.dart';

class DurationSelector extends StatefulWidget {
  const DurationSelector({
    required this.selectedDuration,
    this.onSelected,
    Key? key,
  }) : super(key: key);

  final int selectedDuration;
  final void Function(int)? onSelected;

  @override
  State<DurationSelector> createState() => _DurationSelectorState();
}

class _DurationSelectorState extends State<DurationSelector> {
  @override
  Widget build(BuildContext context) => Wrap(
        children: [
          ChoiceChip(
            label: const Text('1 min'),
            selected: widget.selectedDuration == 1,
            onSelected: (_) => widget.onSelected?.call(1),
          ),
          const SizedBox(width: 4),
          ChoiceChip(
            label: const Text('5 min'),
            selected: widget.selectedDuration == 5,
            onSelected: (_) => widget.onSelected?.call(5),
          ),
          const SizedBox(width: 4),
          ChoiceChip(
            label: const Text('15 min'),
            selected: widget.selectedDuration == 15,
            onSelected: (_) => widget.onSelected?.call(15),
          ),
          const SizedBox(width: 4),
          ChoiceChip(
            label: const Text('30 min'),
            selected: widget.selectedDuration == 30,
            onSelected: (_) => widget.onSelected?.call(30),
          ),
          const SizedBox(width: 4),
          ChoiceChip(
            label: const Text('1 hour'),
            selected: widget.selectedDuration == 60,
            onSelected: (_) => widget.onSelected?.call(60),
          ),
        ],
      );
}
