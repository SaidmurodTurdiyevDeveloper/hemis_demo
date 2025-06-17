import 'package:flutter/material.dart';


class SemesterDropdown extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onSelect;

  const SemesterDropdown({
    super.key,
    required this.selected,
    required this.onSelect,
  }) : assert(selected >= 1 && selected <= 8,
  'selected semester must be between 1 and 8');

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: selected,
      elevation: 1,
      underline: const SizedBox.shrink(),
      borderRadius: BorderRadius.circular(12),
      items: [
        for (var sem = 1; sem <= 8; sem++)
          DropdownMenuItem(
            value: sem,
            child: Text('$sem‑semestr'),
          ),
      ],
      onChanged: (value) {
        if (value != null) onSelect(value);
      },
    );
  }
}
