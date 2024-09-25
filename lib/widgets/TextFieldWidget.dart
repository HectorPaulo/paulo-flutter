import 'package:flutter/material.dart';

class Textfieldwidget extends StatelessWidget {
  final String label;
  final String placeholder;
  final IconData? icon;
  final bool textArea;

  const Textfieldwidget({
    super.key,
    required this.label,
    required this.placeholder,
    this.icon,
    this.textArea = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label),
        const SizedBox(height: 10),
        Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: TextFormField(
              maxLines: textArea ? 6 : null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Placeholder',
                suffixIcon:
                    icon != null ? Icon(icon, color: Colors.grey) : null,
              ),
            ))
      ],
    );
  }
}
