import 'package:flutter/material.dart';

class SelectionCard extends StatelessWidget {
  final String title;
  final Color cardColor;
  final Color cardBorderColor;
  final bool isChecked;
  final Function(bool?) onChanged;
  const SelectionCard({
    Key? key,
    required this.title,
    required this.cardColor,
    required this.cardBorderColor,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: isChecked ? cardColor : null,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isChecked ? cardBorderColor : Colors.blueGrey,
        ),
      ),
      child: Row(
        children: [
          Checkbox(
            shape: const CircleBorder(),
            value: isChecked,
            onChanged: onChanged,
          ),
          Text(title),
        ],
      ),
    );
  }
}
